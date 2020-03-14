class Report < ApplicationRecord
  belongs_to :student
  belongs_to :user
  has_many :comments
end
