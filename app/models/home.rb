class Home < ApplicationRecord
  has_many :appointments
  validates :name, presence: true, uniqueness: {message:"班级名称已存在"}
  belongs_to :user
  has_many :students,  dependent: :destroy
  has_many :users, through: :appointments,  dependent: :destroy
end
