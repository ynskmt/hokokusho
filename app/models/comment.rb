class Comment < ApplicationRecord
  belongs_to :student
  belongs_to :user
  belongs_to :report

  validates :user_id, :student_id, :report_id, presence: true
  validates :text, length: { maximum: 100}
end
