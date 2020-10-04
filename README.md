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
| password          | string  | null: false |
| family_name_kanji | string  | null: false |
| first_name_kanji  | string  | null: false |
| family_name_kana  | string  | null: false |
| first)_name_kana  | string  | null: false |
| birthday          | date    | null: false |

### Association

- has_many :items
- has_many :buyers

## items テーブル

| Column       | Type       | Options     |
| ------------ | ---------- | ----------- |
| name         | string     | null: false |
| description  | text       | null: false |
| category_id  | integer    | null: false |
| status_id    | integer    | null: false |
| deli_char_id | integer    | null: false |
| ship_from_id | integer    | null: false |
| ship_days_id | integer    | null: false |
| price        | integer    | null: false |
| user         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :buyer

## buyers テーブル

| Colum       | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_data

### Shipping_Data
| Colum          | Type       | Options     |
| -------------- | ---------- | ----------- |
| postal_code    | string     | null: false |
| prefectures_id | integer    | null: false |
| city           | string     | null: false |
| house_num      | string     | null: false |
| build_name     | string     |             |
| phone_num      | string     | null: false |
| buyer          | references | null: false, foreign_key: true |
### Association

- belongs_to :buyer
