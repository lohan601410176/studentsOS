class AddAgeToStudents < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :age, :string

  end
end
