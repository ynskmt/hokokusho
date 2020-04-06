class Report < ApplicationRecord
  belongs_to :student
  belongs_to :user
  has_many :comments

  validates :year, :month, :day, :homework_rate, :teacher, :next_class, presence: true
  validates :unit ,length: { maximum: 30}, presence: true
  validates :content ,length: { maximum: 300}, presence: true
  validates :homework ,length: { maximum: 150}, presence: true

end
