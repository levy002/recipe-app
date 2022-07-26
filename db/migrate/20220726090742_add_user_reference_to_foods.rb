class AddUserReferenceToFoods < ActiveRecord::Migration[7.0]
  def change
    add_reference :foods, :user, index: true, foreign_key: true
  end
end
