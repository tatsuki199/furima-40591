# テーブル設計

## users テーブル

|Column            |Type   |Options    |
|------------------|-------|-----------|
|nickname          |string |null:false |
|email             |string |null:false, unique: true |
|encrypted_password|string |null:false |
|last_name         |string |null:false |
|first_name        |string |null:false |
|last_name_kana    |string |null:false |
|first_name_kana   |string |null:false |
|date_of_birth     |integer|null:false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

|Column|Type  |Options     |
|-------------|-------|------------|
|itemname     |string |null: false |
|explanation  |text   |null: false |
|detail       |integer|null: false |
|category     |integer|null: false |
|situation    |integer|null: false |
|load         |integer|null: false |
|region       |integer|null: false |
|delivery_days|integer|null: false |
|selling_price|integer|null: false |
|user         |references|null:false, foreign_key: true |


### Association

- belong_to :user

## purchases テーブル

|Column        |Type      |Options                       |
|--------------|----------|------------------------------|
|card_number   |string    |null:false                    |
|date_of_expiry|string    |null:false                    |
|security_code |string    |null:false                    |
|user          |references|null:false, foreign_key: true |

### Association

- belong_to :user
- has_one :shipping_address

## shipping_addresses テーブル

|Column |Type      |Options                      |
|----------------|----------|-----------------------------|
|post_code       |string    |null:false                   |
|prefectures     |integer   |null:false                   |
|municipalities  |string    |null:false                   |
|street_address  |string    |null:false                   |
|building_name   |string    |                             |
|telephone_number|string    |null:false                   |
|purchase        |references|null:false,foreign_key: true |

### Association

- belong_to :purchase

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
