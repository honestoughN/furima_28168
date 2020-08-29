# テーブル設計

## users テーブル

| Colum           | Type   | Options    |
| --------------- | ------ | ---------- |
| nickname        | string | null:false |
| email           | string | null:false |
| password        | string | null:false |
| first_name      | string | null:false |
| last_name       | string | null:false |
| first_name_kana | string | null:false |
| last_name_kana  | string | null:false |
| date_of_birth   | date   | null:false |

### Association

- has_many :items
- has_many :comments
- has_many :item_purchases

## items テーブル

| Column              | Type    | Options                       |
| ------------------- | ------- | ----------------------------- |
| user_id             | integer | null:false, foreign_key: true |
| name                | string  | null:false                    |
| image               | string  | null:false                    |
| detail              | text    | null:false                    |
| category_id         | integer | null:false                    |
| status_id           | integer | null:false                    |
| shipping_charge_id  | integer | null:false                    |
| shipping_area_id    | integer | null:false                    |
| shipping_day_id     | integer | null:false                    |
| selling_price       | integer | null:false                    |

### Association

- belongs_to :user
- has_many :comments
- has_one :item_purchase

## comments テーブル

| Column  | Type    | Options                       |
| ------- | ------- | ----------------------------- |
| user_id | integer | null:false, foreign_key: true | 
| item_id | integer | null:false, foreign_key: true |
| comment | string  | null:false                    |

### Association

- belongs_to :user
- belongs_to :item

## shipping_addresses テーブル

| Column           | Type    | Options                       |
| ---------------- | ------- | ----------------------------- |
| item_purchase_id | integer | null:false, foreign_key: true |
| postal_code      | string  | null:false                    |
| prefecture_id    | integer | null:false                    |
| city             | string  | null:false                    |
| block_number     | string  | null:false                    |
| building_name    | string  |                               |
| phone_number     | string  | null:false                    |

### Association

- belongs_to :item_purchase

## item_purchases テーブル

| Column  | Type    | Options                       |
| ------- | ------- | ----------------------------- |
| user_id | integer | null:false, foreign_key: true |
| item_id | integer | null:false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address
