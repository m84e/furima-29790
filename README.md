# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column            | Type    | Options     |
| ----------------- | ------- | ----------- |
| nickname          | string  | null: false |
| email_add         | string  | null: false |
| password          | integer | null: false |
| family_name_kanji | string  | null: false |
| first_name_kanji  | string  | null: false |
| family_name_kana  | string  | null: false |
| first)_name_kana  | string  | null: false |
| birthday          | date    | null: false |

### Association

- has_many :items
- has_many :buyers

## items テーブル

| Column    | Type    | Options     |
| --------- | ------- | ----------- |
| user_id   | string  | null: false |
| image     | string  | null: false |
| item_name | string  | null: false |
| item_des  | text    | null: false |
| item_cate | string  | null: false |
| item_sta  | string  | null: false |
| deli_char | string  | null: false |
| ship_from | string  | null: false |
| ship_days | integer | null: false |
| price     | integer | null: false |

### Association

- belongs_to :user
- has_one    :buyers

## buyers テーブル

| Colum       | Type    | Options     |
| ----------- | ------- | ----------- |
| user_id     | string  | null: false |
| item_id     | string  | null: false |
| postal_code | integer | null: false |
| prefectures | string  | null: false |
| city        | string  | null: false |
| add         | integer | null: false |
| build_name  | string  | null: false |
| phone_num   | integer | null: false |

### Association

- belongs_to :user
- belongs)_to :item