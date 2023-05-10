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


## users テーブル
   
| Column                | Type    | Options                  |
| ------------------    | -----   |  -------------------- -  |
| email                 | string  | null: false,unique: true |
| encrypted_password    | string  | null: false              |
| nickname              | string  | null: false              |
| last_name             | string  | null: false              |
| first_name            | string  | null: false              |
| last_name_kana        | string  | null: false              |
| first_name_kana       | string  | null: false              |
| birth_date            | integer | null: false              |

### Association

- has_many :items
- has_many :orders


## items テーブル

| Column                 | Type       | Options                        |
| -------                | ---------- | ------------------------------ |
| name                   | string     | null: false                    |
| info                   | text       | null: false                    |
| category_id            | integer    | null: false                    |
| sales_status_id        | integer    | null: false                    |
| shipping_fee_status_id | integer    | null: false                    |
| prefecture_id          | integer    | null: false                    |
| scheduled_delivery_id  | integer    | null: false                    |
| price                  | integer    | null: false                    |
| user                   | references | null: false, foreign_key: true |



### Association

- belongs_to :user
- has_one :order



## orders テーブル

| Column       | Type       | Options                        |
| -------      | ---------- | ------------------------------ |
| item         | references | null: false, foreign_key: true |
| user         | references | null: false, foreign_key: true |
  
### Association

- belongs_to :user
- belongs_to :item
- has_one :shipment








## shipments テーブル

| Column          | Type       | Options                        |
| -------         | ---------- | ------------------------------ |
| postal_code     | integer    | null: false                    |
| prefecture_id   | integer    | null: false                    |
| city            | string     | null: false                    |
| addresses       | string     | null: false                    |
| building        | string     |                                |
| phone_number    | integer    | null: false                    |
| content         | string     | null: false                    |
| prototype       | string     | null: false                    |
| order           | references | null: false, foreign_key: true |



### Association

- belongs_to :orders




