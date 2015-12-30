class NormalizeClothingStyles < ActiveRecord::Migration
  def up
    add_column :styles, :clothing_id, :integer

    styles = Style.all

    styles.each do |style|
      clothing = Clothing.find_or_create_by(name: style.clothing_type)
      style.clothing_id = clothing.id
      style.save
    end

    remove_column :styles, :clothing_type
  end

  def down
    add_column :styles, :clothing_type, :integer

    styles = Style.all

    styles.each do |style|
      style.clothing_type = style.clothing.name
      style.clothing_id = nil
      style.save
    end

    Clothing.delete_all
  end

end
