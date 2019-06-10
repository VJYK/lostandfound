class AddReturnToFounds < ActiveRecord::Migration[5.2]
  def change
    add_column :founds, :return, :string
  end
end
