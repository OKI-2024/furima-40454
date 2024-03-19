# README

## users

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| password           | string | null: false |
| encrypted_password | string | null: false |
| first_name         | string | null: false |


### Association
- has_many :items
- has_many :purchases

## items

| Column              | Type       | Options     |
| ------------------- | -------    | ----------- |
| image               | text       | null: false |
| name                | string     | null: false |
| description         | string     | null: false |
| status              | string     | null: false |
| delivery_charge     | string     | null: false |
| region              | string     | null: false |
| days_up_to_delivery | string     | null: false |
| price               | integer    | null: false |
| user                | references | null: false, foreign_key: true |

### Association
- belongs_to :users
- has_one :purchase_record

## purchase_records

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| purchaser_id       | integer | null: false |
| item_id            | integer | null: false |


### Association
- belongs_to :item
- belongs_to :user
- has_one :destination

## destination

| Column       | Type    | Options     |
| ------------ |-------- | ----------- |
| postal_code  | integer | null: false |
| pref         | string  | null: false |
| city         | string  | null: false |
| block        | string  | null: false |
| building     | string  |             |
| phone_number | integer | null: false |
| purchase_id  | integer | null: false |


### Association
- belongs_to :purchase_record
