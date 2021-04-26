# テーブル設計

## users テーブル

| Column                  | Type   | Options                  |
| ----------------------- | ------ | ------------------------ |
| child_nickname          | string | null: false              |
| encrypted_password      | string | null: false              |
| email                   | string | null: false, unique:true |
| last_name               | string | null: false              |
| first_name              | string | null: false              |
| last_name_kana          | string | null: false              |
| first_name_kana         | string | null: false              |
| parent_name             | string | null: false              |

### Association

- has_many :rooms
- has_many :comments
- has_many :messages

## rooms テーブル

| Column   | Type   | Options     |
| -------  | -----  | ----------  |
| name     | string | null: false |

###Association

- has_many :room_users
- has_many :rooms, through: room_users
- has_many :message

## room_users テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| room     | references | null: false, foreign_key: true |

###Association

belongs_to :room
belongs_to :user 

## messages テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| content  | string     |                                |
| user     | references | null: false, foreign_key: true |
| room     | references | null: false, foreign_key: true |



## comments テーブル

| Column      | Type       | Options                      |
| ----------- | ---------- | ---------------------------- |
| text        | text       | null: false                  |
| user        | references | foreign_key: true            |
| item        | references | foreign_key: true            |

### Association

- belongs_to :message
- belongs_to :user


## attendance テーブル

| Column | Type       | Options            |
| ------ | ---------- | ------------------ |
| user   | references | foreign_key: true  |
| item   | references | foreign_key: true  |

### Association


- belongs_to :user
