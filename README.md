# テーブル設計

## users テーブル

| Column               | Type   | Options      |
| -------------------  | ------ | ------------ |
| last_name            | string | null: false  |
| last_name_katakana   | string | null: false  |
| first_name           | string | null: false  |
| first_name_katakana  | string | null: false  |
| birthday             | date   | null: false  |  
| email                | string | unique: true |
| encrypted_password   | string | null: false  |

### Association

- has_many :items
- has_many :purchases


## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| item_name           | string     | null: false                    |
| message             | text       | null: false                    |
| price               | int        | null: false                    |
| category_id         | int        | null: false                    | 
| item_status_id      | int        | null: false                    |
| burden_id           | int        | null: false                    |
| shipment_source_id  | int        | null: false                    |
| shipping_days_id    | int        | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association

- has_one    :purchase
- belongs_to :user


## residences テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| state         | string     | null: false                    |
| city          | string     | null: false                    |
| address_line  | string     | null: false                    |
| postal_code   | string     | null: false                    |
| municipality  | string     | null: false                    |
| phone_number  | string     | null: false                    |
| building_name | string     | null: true                     |
| purchase      | references | null: false, foreign_key: true |

### Association

- belongs_to purchase


## purchases テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| room       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :residence
