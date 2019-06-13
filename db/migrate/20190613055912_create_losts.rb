class CreateLosts < ActiveRecord::Migration[5.2]
  def change
    create_table :losts do |t|
      t.string :item_desc
      t.text :item_desc
      t.integer :category_id
      t.integer :user_id

      t.timestamps
    end
  end
end
