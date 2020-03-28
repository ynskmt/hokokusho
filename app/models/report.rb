class Report < ApplicationRecord
  belongs_to :student
  belongs_to :user
  has_many :comments

  validates :year, :month, :day, :homework_rate, :teacher, :confirmation, :next_class, presence: true
  validates :unit ,length: { maximum: 30}
  validates :content ,length: { maximum: 300}
  validates :homework ,length: { maximum: 150}

end
