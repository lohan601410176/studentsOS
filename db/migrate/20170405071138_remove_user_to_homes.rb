class RemoveUserToHomes < ActiveRecord::Migration[5.0]
  def change
    remove_reference :homes, :user, foreign_key: true
  end
end
