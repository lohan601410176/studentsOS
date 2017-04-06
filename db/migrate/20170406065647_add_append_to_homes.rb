class AddAppendToHomes < ActiveRecord::Migration[5.0]
  def change
    add_column :homes, :append, :string

  end
end
