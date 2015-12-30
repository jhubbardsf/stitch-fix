class MoveMinimumPriceToClothings < ActiveRecord::Migration
  def change
    remove_column :styles, :minimum, :decimal
    add_column :clothings, :minimum, :decimal, default: 0.0
  end
end
