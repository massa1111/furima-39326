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
| password-confirmation | string  | null: false              |
| nickname              | string  | null: false              |
| last-name             | string  | null: false              |
| first-name            | string  | null: false              |
| last-name-kana        | string  | null: false              |
| first-name-kana       | string  | null: false              |
| birth-date            | integer | null: false              |

### Association

- has_many :items
- has_many :orders


## items テーブル

| Column                   | Type       | Options                        |
| -------                  | ---------- | ------------------------------ |
| item-name                | string     | null: false                    |
| item-info                | text       | null: false                    |
| item-category            | string     | null: false                    |
| item-sales-status        | string     | null: false                    |
| item-shipping-fee-status | string     | null: false                    |
| item-prefecture          | string     | null: false                    |
| item-scheduled-delivery  | string     | null: false                    |
| item-price               | integer    | null: false, foreign_key: true |
| user_id                  | references | null: false, foreign_key: true |



### Association

- belongs_to :users
- has_one :orders



## orders テーブル

| Column       | Type       | Options                        |
| -------      | ---------- | ------------------------------ |
| item_id      | references | null: false, foreign_key: true |
| user_id      | references | null: false, foreign_key: true |
  
### Association

- belongs_to :users
- belongs_to :items
- has_one :shipments








## shipments テーブル

| Column       | Type       | Options                        |
| -------      | ---------- | ------------------------------ |
| postal-code  | integer    | null: false                    |
| prefecture   | string     | null: false                    |
| city         | string     | null: false                    |
| addresses    | string     | null: false                    |
| building     | string     | null: false                    |
| phone-number | integer    | null: false                    |
| content      | string     | null: false                    |
| prototype    | string     | null: false                    |
| order_id     | references | null: false, foreign_key: true |



### Association

- belongs_to :orders




