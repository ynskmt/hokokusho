class StudentUser < ApplicationRecord
  belongs_to :student
  belongs_to :user
end
