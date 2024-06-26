# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| nickname           | string | null: false               |
| first_name         | string | null: false               |
| family_name        | string | null: false               |
| first_name_kana    | string | null: false               |
| family_name_kana   | string | null: false               |
| birth_day          | date   | null: false               |

### Association
- has_many :items
- has_many :buys

## items テーブル

| Column      | Type       | Options                           |
| ----------- | ---------- | --------------------------------- |
| name        | string     | null: false                       |
| text        | text       | null: false                       |
| price       | integer    | null: false                       |
| user        | references | null: false, foreign_key: true    |

### Association
- belongs_to :buys
- belongs_to :users

## buys テーブル

| Column      | Type       | Options                       |
| ------------| ---------- | ----------------------------- |
| item        | references | null: false, foreign_key: true|
| user        | references | null: false, foreign_key: true|

### Association
- belongs_to :users
- has_many :items
- has_one :addresses

## addresses テーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| code               | string     | null: false                   |
| prefecture         | string     | null: false                   |
| city               | string     | null: false                   |
| street             | string     | null: false                   |
| building           | string     |                               |
| phone_number       | string     | null: false                   |
| buy                | references | null: false, foreign_key: true|

### Association
- belongs_to :buys