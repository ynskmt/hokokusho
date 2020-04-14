# アプリ名
- hokokusho

# 概要
- 個別指導塾において授業毎に講師が保護者に向けて学習内容や塾での様子などを伝えるツール
- TECK::EXPERTで学んだことの復習として作成

# 本番環境
- URL
  - https://hokokusho.herokuapp.com/
- ID/Pass   
  - ID: kinkaku
  - Pass: ginkaku
- 講師用アカウント
  - メールアドレス: sakamotoryoma@hokokusho.com
  - パスワード: sakamotoryoma
- 保護者用アカウント
  - メールアドレス: tanakahahaoya@hokokusho.com
  - パスワード: tanakahahaoya
- 生徒用アカウント
  - メールアドレス: tanakatarou@hokokusho.com
  - パスワード: tanakatarou

# 制作背景
- 現在の報告書は複写式の紙媒体であり手間が多いためそれを改善する。
- 生徒が持参し忘れることがあり、続きに書くことができない状態を改善する。

# 機能詳細
- ユーザー登録は講師・保護者・生徒の３パターンで作成可能
- 講師は担当生徒が増えた場合、新規生徒の報告書を作成
- 講師は自分の担当生徒の報告書、保護者は自分の子どもの報告書、生徒は自分の報告書のみ閲覧可能
- 報告書に対するコメントは保護者のみ記入可能

# DEMO
- 新しい報告書を作るページ
![create_hokokusho_demo](https://user-images.githubusercontent.com/57008698/79242868-cfdd8800-7eaf-11ea-9965-2c464de3e28c.gif)


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