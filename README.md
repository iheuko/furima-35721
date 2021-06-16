# テーブル設計

## users テーブル

| Column               | Type   | Options                  |
| -------------------  | ------ | ------------------------ |
| last_name            | string | null: false              |
| last_name_katakana   | string | null: false              |
| first_name           | string | null: false              |
| first_name_katakana  | string | null: false              |
| nickname             | string | null: false              |
| birthday             | date   | null: false              |  
| email                | string | unique: true, null: false|
| encrypted_password   | string | null: false              |

### Association

- has_many :items
- has_many :orders


## items テーブル

| Column              | Type           | Options                        |
| ------------------- | -------------- | ------------------------------ |
| item_name           | string         | null: false                    |
| message             | text           | null: false                    |
| price               | integer        | null: false                    |
| category_id         | integer        | null: false                    | 
| item_status_id      | integer        | null: false                    |
| burden_id           | integer        | null: false                    |
| state_id            | integer        | null: false                    |
| shipping_day_id     | integer        | null: false                    |
| user                | references     | null: false, foreign_key: true |

### Association

- has_one    :order
- belongs_to :user


## residences テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| state_id      | integer    | null: false                    |
| city          | string     | null: false                    |
| address_line  | string     | null: false                    |
| postal_code   | string     | null: false                    |
| municipality  | string     | null: false                    |
| phone_number  | string     | null: false                    |
| building_name | string     | null: true                     |
| order         | references | null: false, foreign_key: true |

### Association

- belongs_to :order


## orders テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :residence
