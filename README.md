# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| name_katakana      | string | null: false |
| birthday           | int    | null: false |  
| email              | string | null: false |
| encrypted_password | string | null: false |

### Association

- has_many :items
- has_many :residences
- has_many :purchases


## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| item_name     | string     | null: false                    |
| category      | string     | null: false                    |
| message       | text       | null: false                    | 
| price         | int        | null: false                    |
| item_status   | string     | null: false                    |
| burden        | string     | null: false                    |
| shipping_days | string     | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- has_one    :purchase
- belongs_to :residence
- belongs_to :user


## residences テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| state         | string     | null: false                    |
| city          | string     | null: false                    |
| address_line  | string     | null: false                    |
| postal_code   | int        | null: false                    |
| municipality  | string     | null: false                    |
| phone_number  | int        | null: false                    |
| building_name | string     | null: true                     |
| user          | references | null: false, foreign_key: true |

### Association
- has_many   :purchases
- has_many   :item
- belongs_to :user


## purchases テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| room       | references | null: false, foreign_key: true |
| residences | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :residence
