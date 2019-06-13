class AddUserToLosts < ActiveRecord::Migration[5.2]
  def change
  	add_reference :losts, :user, foreign_key: true
  end
end
