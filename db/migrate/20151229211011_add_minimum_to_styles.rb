class AddMinimumToStyles < ActiveRecord::Migration
  def change
    add_column :styles, :minimum, :decimal
  end
end
