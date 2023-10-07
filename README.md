# テーブル設計

## users テーブル

| Column              | Type       | Options                   |
| ------------------  | ---------- | ------------------------- |
| nickname            | string     | null: false               |
| email               | string     | null: false, unique: true |
| encrypted_password  | string     | null: false               |
| first_name_kanji    | string     | null: false               |
| last_name_kanji     | string     | null: false               |
| first_name_furigana | string     | null: false               |
| last_name_furigana  | string     | null: false               | 
| birthday            | date       | null: false               |

### Association
- has_many   :items
- has_many   :orders


## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| description        | text       | null: false                    |
| price              | integer    | null: false                    |
| category_id        | integer    | null: false                    |
| quality_id         | integer    | null: false                    |
| shipping_fee_id    | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| processing_time_id | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one    :order

## orders テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one    :addresses

## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | string     | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |
| order         | references | null: false, foreign_key: true |


### Association
- belongs_to :order

