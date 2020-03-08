class Student < ApplicationRecord
  has_many :reports
  has_many :student_users
  has_many :users, through: :student_users
  validates :name, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :school
  belongs_to_active_hash :grade
  belongs_to_active_hash :subject
end
