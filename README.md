# アプリケーション名
WirelessEarphone.com

# 概要
あらゆるワイヤレスイヤホンについての情報が載っている「製品まとめ・比較アプリ」

# URL
https://wirelessearphone-36402.herokuapp.com/

# テスト用アカウント
Basic認証：ユーザー名「admin」パスワード「2222」
ログイン用アカウント：メールアドレス「wireless@gmail.com」パスワード「wireless1」

# 利用方法
知りたいワイヤレスイヤホンの情報を簡単に探したり比較することができ、さらにレビューを投稿・閲覧したり、気になるイヤホンを登録しておくことで、いつでもすぐに情報を確認することもできる。

# 目指した課題解決
1. ワイヤレスイヤホンについての情報を調べる時に、各企業のHPを1つ1つ検索して調べる手間を無くすこと
2. 気になっているワイヤレスイヤホンの違いを簡単に比較することができるようにすること

# 洗い出した要件
製品一覧表示機能
製品検索機能
製品追加登録機能
製品詳細表示機能
レビュー投稿・編集・削除機能
製品評価平均表示機能
製品お気に入り登録機能
製品比較機能
ユーザー管理機能

# 実装した機能についての画像やGIFおよびその説明

# 実装予定の機能

# ローカルでの動作方法

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