
# アプリ名						
関西美味いもんシェフ

# 概要
関西限定出張シェフサービスのBtoCサイトです。３つの課題を解決するために開発します。			-コロナ禍で自由に外食ができなくなった人たちに美味しい料理を提供する
-飲食で働いている人たちに働く場所を提供する
-関西特化のサイトがない
# 制作背景(意図)						
			

# DEMO(gifで動画や写真を貼って、ビューのイメージを掴んでもらいます)						
⇒できている範囲で貼り付けましょう。						

# 実装予定の内容


# テーブル設計

## user テーブル

| Column                 | Type   | Options                  |
| ---------------------- | ------ | -----------              |
| user_email             | string | null: false,unique: true |
| use_encrypted_password | string | null: false              |
| user_nickname          | string | null: false              |
| user_family_name       | string | null: false              |
| user_first_name        | string | null: false              |
| user_birth_id          | date   | null: false              |
 
### Association

- has_many :rooms
- has_many :reviews
- has_many :reservation

## chef テーブル

| Column                   | Type   | Options                  |
| ------------------------ | ------ | ------------------------ |
| chef_email               | string | null: false,unique: true |
| chef_encrypted_password  | string | null: false              |
| chef_nickname            | string | null: false              |
| chef_family_name         | string | null: false              |
| chef_first_name          | string | null: false              |
| chef_career              | text   | null: false              |
| chef_belong              | string | null: false              |
| chef_phone_number        | string | null: false              |
| chef_birth_id            | string | null: false              |
### Association

- has_many :courses
- has_many :reviews
- has_many :rooms

## course テーブル

| Column                   | Type    | Options                          |
| ------------------------ | ------- | -------------------------------- |
| course_title             | string  | null: false                      |
| description              | string  | null: false                      |
| price                    | integer | null: false                      |
| start_date               | date    | null: false                      |
| end_date                 | date    | null: false                      |
| chef                     | references |null: false, foreign_key: true |
### Association

- belongs_to :chef
- has_one    :course
//複数日程を予約できるようにする

## reservation テーブル

| Column                   | Type       | Options                       |
| ------------------------ | ---------- | ----------------------------- |
| allergies                | string     | null: false                   |
| place                    | string     | null: false                   |
| user_phone_number        | string     | null: false                   |
| request                  | string     |                               |
| course_id                | references |null: false, foreign_key: true |
| user_id                  | references |null: false, foreign_key: true |
### Association

- belongs_to :course
- belongs_to :user
- has_one    :room

## review テーブル

| Column                   | Type       | Options                       |
| ------------------------ | ---------- | ----------------------------- |
| review_title             | string     | null: false                   |
| review_text              | text       | null: false                   |
| rate                     | string     | null: false                   |
| chef_id                  | references |null: false, foreign_key: true |
| user_id                  | references |null: false, foreign_key: true |
### Association

- belongs_to :user
- belongs_to :chef

## chatroom テーブル

| Column                   | Type       | Options                       |
| ------------------------ | ---------- | ----------------------------- |
| chat_text                | text       | null: false                   |
| chef_id                  | references |null: false, foreign_key: true |
| user_id                  | references |null: false, foreign_key: true |
### Association

- belongs_to :user
- belongs_to :chef
- belongs_to :reservation