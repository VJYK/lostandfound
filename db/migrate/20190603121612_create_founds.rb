class CreateFounds < ActiveRecord::Migration[5.2]
  def change
    create_table :founds do |t|
      t.string :item_name
      t.text :item_desc
      t.integer :category_id
      t.integer :user_id

      t.timestamps
    end
  end
end
