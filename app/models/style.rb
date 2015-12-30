class Style < ActiveRecord::Base
  has_many :items
  belongs_to :clothing
end
