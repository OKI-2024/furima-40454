# README

## users

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_kana    | string | null: false |
| last_name_kana     | string | null: false |
| birthday           | date   | null: false |


### Association
- has_many :items
- has_many :purchase_records

## items

| Column                 | Type       | Options     |
| ---------------------- | -------    | ----------- |
| name                   | string     | null: false |
| description            | text       | null: false |
| category_id            | integer    | null: false |
| status_id              | integer    | null: false |
| delivery_charge_id     | integer    | null: false |
| region_id              | integer    | null: false |
| days_up_to_delivery_id | integer    | null: false |
| price                  | integer    | null: false |
| user                   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase_record
- belongs_to :category
- belongs_to :status
- belongs_to :delivery_charge
- belongs_to :region
- belongs_to :days_up_to_delivery

## purchase_records

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |


### Association
- belongs_to :item
- belongs_to :user
- has_one :destination

## destination

| Column             | Type        | Options     |
| ------------------ |------------ | ----------- |
| postal_code        | string      | null: false |
| region_id          | integer     | null: false |
| city               | string      | null: false |
| block              | string      | null: false |
| building           | string      |             |
| phone_number       | string      | null: false |
| purchase_record    | references  | null: false, foreign_key: true |


### Association
- belongs_to :purchase_record
- belongs_to :region
