class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reports, dependent: :destroy
  has_many :student_users, dependent: :destroy
  has_many :students, through: :student_users
  has_many :comments, dependent: :destroy

  validates :first_name, :last_name, :user_status_id, :email, :encrypted_password, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :user_status
  
end
