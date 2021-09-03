# データベース設計

## itemsテーブル

| Column  | Type    | Option      |
| ------- | ------- | ----------- |
| name    | string  | null: false |
| price   | integer | null: false |
| maker   | string  | null: false |
| sound   | string  |             |
| anc     | string  |             |
| ambient | string  |             |
| type    | string  |             |
| size    | string  |             |
| codec   | string  |             |
| date    | date    |             |

### Association

has_many :reviews

## reviewsテーブル

| Column  | Type        | Option                          |
| ------- | ----------- | ------------------------------- |
| title   | string      | null: false                     |
| text    | text        | null: false                     |
| point   | integer     | null: false                     |
| user_id | references  | null: false, foreign_key: true  |
| item_id | references  | null: false, foreign_key: true  |

### Association

belongs_to :user
belongs_to :item
has_many :comments

## commentsテーブル

| Column    | Type        | Option                          |
| -------   | ----------- | ------------------------------- |
| text      | string      | null: false                     |
| user_id   | references  | null: false, foreign_key: true  |
| review_id | references  | null: false, foreign_key: true  |

### Association

belongs_to :user
belongs_to :review

## usersテーブル

| Column             | Type   | Option      |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |

### Association

has_many :reviews
has_many :comments