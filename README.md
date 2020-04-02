# README

# hokokusho DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|last_name|string|null: false|
|first_name|string|null: false|
|user_status_id|string|null: false|
|email|string|null: false|
|encrypted_password|string|null: false|
### Association
- has_many :students,  through:  :students_users
- has_many :students_users
- has_many :reports
- has_many :comments

## studentsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|school_id|string|null: false|
|subject_id|string|null: false|
|grade_id|string|null: false|
### Association
- has_many :reports
- has_many :comments
- has_many :students_users
- has_many :users,  through:  :students_users

## reportsテーブル
|Column|Type|Options|
|------|----|-------|
|year|integer|null: false|
|month|integer|null: false|
|day|integer|null: false|
|unit|string|null: false|
|homework_rate|string|null: false|
|mini_test|string|
|mini_test_rate|string|
|content|text|null: false|
|teacher|string|null: false|
|comfirmation|string|null: false|
|homework|text|null: false|
|date|next_class|null: false|
|user|integer|null: false, foreign_key: true|
|student|integer|null: false, foreign_key: true|
### Association
- belongs_to :student
- belongs_to :user
- has_many :comments

## students_usersテーブル
|Column|Type|Options|
|------|----|-------|
|user|integer|null: false, foreign_key: true|
|student|integer|null: false, foreign_key: true|
### Association
- belongs_to :student
- belongs_to :user

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|report_id|string|null: false|
|student_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :student
- belongs_to :report