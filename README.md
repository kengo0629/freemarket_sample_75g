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
|status|string|null:false|
|send_fee|integer|null:false|
|region|string|null:false|
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
|number|integer|null:false|
|user_id|integer|null:false,foreign_key:true|

###Association
- belongs_to :user

##product_imagesテーブル

|Column|Type|Options|
|------|----|-------|
|product_id|integer|null:false, foreign_key:true|
|image|string|null:false|

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
