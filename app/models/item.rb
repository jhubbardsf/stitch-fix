class Item < ActiveRecord::Base

  CLEARANCE_PRICE_PERCENTAGE  = BigDecimal.new("0.75")

  belongs_to :style
  belongs_to :clearance_batch

  validates :status, inclusion: { in: ['sellable', 'not sellable', 'sold', 'clearanced'],
                                  message: "%{value} is not a valid status" }

  scope :sellable, -> { where(status: 'sellable') }

  def clearance!
    regular_clearance = style.wholesale_price * CLEARANCE_PRICE_PERCENTAGE
    minimum_clearance = style.clothing.minimum
    update_attributes!(status: 'clearanced', 
                       price_sold: [regular_clearance, minimum_clearance].max)
  end

end
