class AddScoreToStudents < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :score, :string

  end
end
