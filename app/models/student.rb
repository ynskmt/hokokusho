class Student < ApplicationRecord
  has_many :comments
  has_many :reports, dependent: :destroy
  has_many :student_users, dependent: :destroy
  has_many :users, through: :student_users
  validates :name, :school_id, :grade_id, :subject_id, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :school
  belongs_to_active_hash :grade
  belongs_to_active_hash :subject
end
