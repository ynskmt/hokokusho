class Report < ApplicationRecord
  belongs_to :student
  belongs_to :user
  has_many :comments

  validates :year, :month, :day, :unit, :homework_rate, :content, :teacher, :confirmation, :homework, :next_class, presence: true
end
