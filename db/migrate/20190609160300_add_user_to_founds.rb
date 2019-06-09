class AddUserToFounds < ActiveRecord::Migration[5.2]
  def change
    add_reference :founds, :user, foreign_key: true
  end
end
