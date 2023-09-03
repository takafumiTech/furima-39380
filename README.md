# テーブル設計

## users テーブル

| Column              | Type       | Options           |
| ------------------  | ---------- | ------------------|
| nickname            | string     | null: false       |
| email               | string     | null: false       |
| encrypted_password  | string     | null: false       |
| first_name_kanji    | string     | null: false       |
| last_name_kanji     | string     | null: false       |
| first_name_furigana | string     | null: false       |
| last_name_furigana  | string     | null: false       |
| birthday            | string     | null: false       |

### Association
- has_many   :items
- has_many   :comments
- has_many   :orders


## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| photo           | string     | null: false                    |
| name            | string     | null: false                    |
| description     | text       | null: false                    |
| category        | string     | null: false                    |
| quality         | string     | null: false                    |
| delivery_fee    | string     | null: false                    |
| ship_from       | string     | null: false                    |
| processing_time | string     | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many   :comments
- has_one    :order

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item

## orders テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :items
- has_one    :address

## address テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_code     | string     | null: false                    |
| prefecture    | string     | null: false                    |
| city          | string     | null: false                    |
| address1      | string     | null: false                    |
| address2      | string     | null: false                    |
| phone_number  | string     | null: false                    |
| order         | references | null: false, foreign_key: true |


### Association
- belongs_to :order

