class AddScoreToHomes < ActiveRecord::Migration[5.0]
  def change
    add_column :homes, :score, :string

  end
end
