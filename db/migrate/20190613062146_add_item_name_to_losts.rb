class AddItemNameToLosts < ActiveRecord::Migration[5.2]
  def change
    add_column :losts, :item_name, :string
  end
end
