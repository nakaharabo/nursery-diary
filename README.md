# テーブル設計

## users テーブル

| Column                  | Type   | Options                  |
| ----------------------- | ------ | ------------------------ |
| nickname                | string | null: false              |
| encrypted_password      | string | null: false              |
| email                   | string | null: false, unique:true |
| last_name               | string | null: false              |
| first_name              | string | null: false              |
| last_name_kana          | string | null: false              |
| first_name_kana         | string | null: false              |
| birth_day               | date   | null: false              |

### Association

- has_many :items
- has_many :comments
- has_many :histories

## items テーブル

| Column           | Type       | Options           |
| ---------------- | -----------| ----------------- |
| name             | string     | null: false       |
| description      | text       | null: false       |
| category_id      | integer    | null: false       |
| state_id         | integer    | null: false       |
| delivery_fee_id  | integer    | null: false       |
| shipment_area_id | integer    | null: false       |
| shipment_day_id  | integer    | null: false       |
| price            | integer    | null: false       |
| history          | references | foreign_key: true |
### Association

- belongs_to :user
- has_many :comments
- has_one :history


## orders テーブル

| Column           | Type       | Options            |
| ---------------- | ---------- | ------------------ |
| post_number      | string     | null: false        |
| shipment_area_id | integer    | null: false        |
| city             | string     | null: false        |
| address          | string     | null: false        |
| building_name    | string     |                    |
| phone_number     | string     | null: false        |
| history          | references | foreign_key: true  |

### Association
- belongs_to :history



## comments テーブル

| Column      | Type       | Options                      |
| ----------- | ---------- | ---------------------------- |
| text        | text       | null: false                  |
| user        | references | foreign_key: true            |
| item        | references | foreign_key: true            |

### Association

- belongs_to :item
- belongs_to :user


## history テーブル

| Column | Type       | Options            |
| ------ | ---------- | ------------------ |
| user   | references | foreign_key: true  |
| item   | references | foreign_key: true  |

### Association

- belongs_to :item
- belongs_to :user
- has_one :order
