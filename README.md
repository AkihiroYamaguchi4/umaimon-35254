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