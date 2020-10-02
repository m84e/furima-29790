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

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| nickname      | string  | null: false |
| email_add     | string  | null: false |
| password      | integer | null: false |
| name_kanji    | string  | null: false |
| name_kana     | string  | null: false |
| birthday      | integer | null: false |

### Association

- has_many :items
- has_many :buyers

## items テーブル

| Column    | Type    | Options     |
| ----------| --------| ------------|
| image     | string  | null: false |
| item_name | string  | null: false |
| price     | integer | null: false |

### Association

- belongs_to :users
- has_one    :buyers

## buyers テーブル

| Colum      | Type    | Options     |
| -----------| --------|-------------|
| card_num   | integer | null: false |
| exp_date   | integer | null: false |
| sec_code   | integer | null: false |
| pos_code   | integer | null: false |
| city       | string  | null: false |
| add        | integer | null: false |
| build_name | string  | null: false |
| phone_num  | integer | null: false |

### Association

- belongs_to :users
- belongs)_to :items