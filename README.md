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

| Column           | Type       | Options                           |
| ---------------- | ---------- | --------------------------------- |
| name             | string     | null: false                       |
| description      | text       | null: false                       |
| category_id      | integer    | null: false                       |
| condition_id     | integer    | null: false                       |
| shopping_fee_id  | integer    | null: false                       |
| prefecture_id    | integer    | null: false                       |
| shopping_day_id  | integer    | null: false                       |
| price            | integer    | null: false                       |
| user             | references | null: false, foreign_key: true    |

### Association
- has_one :buy
- belongs_to :user

## buys テーブル

| Column      | Type       | Options                       |
| ------------| ---------- | ----------------------------- |
| item        | references | null: false, foreign_key: true|
| user        | references | null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| code               | string     | null: false                   |
| prefecture_id      | integer    | null: false                   |
| city               | string     | null: false                   |
| street             | string     | null: false                   |
| building           | string     |                               |
| phone_number       | string     | null: false                   |
| buy                | references | null: false, foreign_key: true|

### Association
- belongs_to :buy