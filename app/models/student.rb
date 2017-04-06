class Student < ApplicationRecord
  validates :name, presence: {:message => "姓名不能为空"}
  belongs_to :home
end
