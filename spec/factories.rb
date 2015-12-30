FactoryGirl.define do
  factory :clothing do
      name "Pants"
      minimum 5

      factory :top do
        name "Top"
        minimum 2
      end
  end

  factory :clearance_batch do

  end

  factory :item do
    style
    color "Blue"
    size "M"
    status "sellable"
  end

  factory :style do
    clothing
    wholesale_price 55
    name "Bubble Pants"
  end

end
