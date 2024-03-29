# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def make_items(style,color,sizes: { 'M' => 10, 'S' => 5, 'L' => 10 })
  sizes.each do |size,count|
    count.times do
      Item.create(color: color, size: size, status: 'sellable', style: style)
    end
  end
end

clothings = %w(Sweater Top Dress Pants Scarf)
c_array = {}

clothings.each do |clothing|
  price = ( clothing == 'Pants' || clothing == 'Dress' ) ? 5.0 : 2.0
  new_clothing = Clothing.create(name: clothing, minimum: price)
  c_array[new_clothing.name] = new_clothing.id
end

Style.create(name: "Abrianna Lightweight Knit Cardigan",
             clothing_id: c_array["Sweater"],  wholesale_price: 10, retail_price: 60).tap { |style|
  make_items(style,"Purple")
  make_items(style,"Blue")
}
Style.create(name: "Bryan Short-Sleeve Open-Front Cardigan",
             clothing_id: c_array["Sweater"],  wholesale_price: 15, retail_price: 60).tap { |style|
  make_items(style,"Red")
  make_items(style,"Blue")
}
Style.create(name: "Vicky Colorblock Trim Silk Blouse",
             clothing_id: c_array["Top"],      wholesale_price: 13, retail_price: 45).tap { |style|
  make_items(style,"White")
}
Style.create(name: "Collegno Diamond Print Drawstring Waist Dress",
             clothing_id: c_array["Dress"],    wholesale_price: 18, retail_price: 80).tap { |style|
  make_items(style,"Orange")
  make_items(style,"Green")
}
Style.create(name: "Pomelo Critter Print Maxi Dress",
             clothing_id: c_array["Dress"],    wholesale_price: 6, retail_price: 80).tap { |style|
  make_items(style,"Orange")
  make_items(style,"Green")
}
Style.create(name: "Leah Straight Leg Cuffed Jean",
             clothing_id: c_array["Pants"],    wholesale_price: 34, retail_price: 90).tap { |style|
  make_items(style,"Navy")
  make_items(style,"Black")
}
Style.create(name: "Henry Birds on Branch Infinity Scarf",
             clothing_id: c_array["Scarf"],    wholesale_price: 2, retail_price: 30).tap { |style|
  make_items(style,"Turquoise", sizes: { 'ANY' => 20 })
}
Style.create(name: "Blue Camo Print Boyfriend Jeans",
             clothing_id: c_array["Pants"],    wholesale_price: 5, retail_price: 70).tap { |style|
  make_items(style,"Navy")
}
