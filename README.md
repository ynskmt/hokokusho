# アプリ名
## hokokusho

# 概要
個別指導塾において授業毎に講師が保護者に向けて学習内容や塾での様子などを伝えるツール

# 本番環境
## Heroku
https://hokokusho.herokuapp.com/

# 制作背景
- 現在の報告書は複写式の紙媒体であり手間が多いためそれを改善する。
- 生徒が持参し忘れることがあり、続きに書くことができない状態を改善する。

# DEMO
新しい報告書を作るページ
<img width="1435" alt="report_new" src="https://user-images.githubusercontent.com/57008698/78261694-7fbf0700-753a-11ea-805a-b7f938f6f133.png">

# DB設計
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