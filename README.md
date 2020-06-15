# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# New Read
[![Image from Gyazo](https://i.gyazo.com/eff01fe75845e2b7eca3f7d8e164b649.jpg)](https://gyazo.com/eff01fe75845e2b7eca3f7d8e164b649)

# 概要

Gitを用いてグループでのECサイト（フリマアプリ）の作成

# アプリケーション名

FURIMA

# 制作背景

①Gitを使用してのアジャイル開発を学ぶ</br>

②実戦的なチーム開発を経験する</br>

③実装した事のない機能に対する検索力や仮説力を鍛える</br>

④開発の中で利用するユーザー目線を学ぶ

# 実装機能

①ユーザー登録/ログイン/ログアウト機能</br>

②商品出品/削除/編集/詳細機能</br>

③一覧表示機能</br>

④商品購入/クレジットカード登録機能</br>

# 開発環境

Ruby/Ruby on Rails/Javascript/Haml/Sass/Github/Visual Studio Code

# 本番環境情報

■ URL
IPアドレス：http://18.180.139.240/
Github（最終課題のリポジトリ）：gouta11116/freemarket_sample_75g

■ Basic認証
ID：freemarketg
Pass：shibuya75g

■ テスト用アカウント
◯ 購入者用
メールアドレス：test2@gmail.com
パスワード：4r4r4r4r

◯ 購入用カード情報
番号：4242424242424242
期限：26年11月
セキュリティカード：111

◯ 出品者用
メールアドレス：test1@gmail.com
パスワード：5t5t5t5t
##usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null:false|
|email|string|null:false,uniqueness:{case_sensitive: false},format: {with:/\A[\w+-.]+@[a-z\d-.]+.[a-z]+\z/i}|
|password|string|null:false,length:{minimum:7}|
|password_conform|string|null:false|
|first_name|string|null:false|
|last_name|string|null:false|
|first_name_kana|string|null:false|
|last_name_kana|string|null:false|
|birthday|date|null:false|

###Association
- has_many :products
- has_one :address
- has_one :card

##productsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|description|text|null:false|
|brand|string|
|status|integer|null:false(enum)|
|send_fee|integer|null:false|
|region_id|string|null:false|
|send_day|integer|null:false|
|price|integer|null:false|
|user_id|integer|null:false, foreign_key:true|
|buy_user_id|integer|null:false, foreign_key|

###Association
- has_many :products_images
- belongs_to :category
- belongs_to :user
- belongs_to :buy_user, optional: true, class_name:"User", foreign_key: "buy_user_id

##addressテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null:false,foreign_key:true|
|postal_code|string|null:false|
|prefecture|string|null:false|
|ctiy|string|null:false|
|house_number|string|null:false|
|building_name|string|

###Association
- belongs_to :user

##cardsテーブル

|Column|Type|Options|
|------|----|-------|
|customer_id|string|null:false|
|user_id|integer|null:false,foreign_key:true|
|card_id|string|null:false|

###Association
- belongs_to :user

##imagesテーブル

|Column|Type|Options|
|------|----|-------|
|product_id|integer|null:false, foreign_key:true|
|src|string|null:false|

###Association
- belongs_to :product

##categoryテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|ancestry|string|null:false|

###Association
- has_many :products
- has_ancestry

##perchasesテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|null:false,foreign_key:true|
|postcode|string|null:false|
|prefectere|string|null:false|
|city|string|null:false|
|block|string|null:false|
|building|string|
|phone_number|string|
