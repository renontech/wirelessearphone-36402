# アプリケーション名
WirelessEarphone.com

# 概要
あらゆるワイヤレスイヤホンについての情報が載っている「製品まとめ・比較アプリ」  
※現在ローカルでのみ正常に作動

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
※以下の画像とGIFはローカル環境のものです。
## 製品一覧表示機能
[![Image from Gyazo](https://i.gyazo.com/b507492cd6573340ff6424f141b46f68.jpg)](https://gyazo.com/b507492cd6573340ff6424f141b46f68)

## 製品検索機能
[![Image from Gyazo](https://i.gyazo.com/48e62cdc2a96f73f55f632c55836ea8b.gif)](https://gyazo.com/48e62cdc2a96f73f55f632c55836ea8b)

## 製品追加登録機能
[![Image from Gyazo](https://i.gyazo.com/fd67c258bc248a91e6d860f897970bb9.gif)](https://gyazo.com/fd67c258bc248a91e6d860f897970bb9)

## 製品詳細表示機能
[![Image from Gyazo](https://i.gyazo.com/68cca5e074610da25b4c02a3b30160e8.gif)](https://gyazo.com/68cca5e074610da25b4c02a3b30160e8)

## レビュー投稿機能
[![Image from Gyazo](https://i.gyazo.com/d5e81a26ba3600380b3eaa6b5d3236a9.gif)](https://gyazo.com/d5e81a26ba3600380b3eaa6b5d3236a9)

## レビュー編集機能
[![Image from Gyazo](https://i.gyazo.com/f60c0eaf2d899e8cfb1ebbe358c1d06d.gif)](https://gyazo.com/f60c0eaf2d899e8cfb1ebbe358c1d06d)

## レビュー削除機能
[![Image from Gyazo](https://i.gyazo.com/142ed7337712df77fa8c62bbcdba6495.gif)](https://gyazo.com/142ed7337712df77fa8c62bbcdba6495)

## 製品評価平均表示機能
[![Image from Gyazo](https://i.gyazo.com/34b1e0de5e346e4c720fd2caaa7db556.jpg)](https://gyazo.com/34b1e0de5e346e4c720fd2caaa7db556)

## 製品お気に入り登録機能
[![Image from Gyazo](https://i.gyazo.com/0eedcf490fd7bdcc816eea4050ac877d.gif)](https://gyazo.com/0eedcf490fd7bdcc816eea4050ac877d)

## 製品比較機能
[![Image from Gyazo](https://i.gyazo.com/d732dd96cbc72525e7f406dc29e2e0ff.gif)](https://gyazo.com/d732dd96cbc72525e7f406dc29e2e0ff)

# 実装予定の機能

# ローカルでの動作方法
Railsバージョン6.0.0  
クローン後下記のコマンドを実行してください
- bundle install
- yarn install
- rails db:create
- rails db:migrate

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