class ChangeStyleTypeToClothingType < ActiveRecord::Migration
  def change
    rename_column :styles, :type, :clothing_type
  end
end
