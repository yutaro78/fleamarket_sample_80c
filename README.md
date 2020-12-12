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



* ## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false,unique:true|
|password|string|null: false|
|nickname|string|null: false|
|firstname|string|null:false|
|lastname|string|null:false|
|firstname_kana|string|null:false|
|lastname_kana|string|null:false|
|birth|date|null:false|

### Association
- has_many:comments
- has_many:favorites
- has_many :order
- has_one:pay
- has_one:adress
- has_many:items


### adresses テーブル
|Column|Type|Options|
|------|----|-------|
|post_code |string|null: false|
|prefecture_code| integer|null: false|
|city|string|null: false|
|house_number| string|null: false|
|building_name| string|
|user|references|null:false, foreign_key:true|


### Association
- belongs_to:user
- belongs_to_active_hash :prefecture



### pays テーブル
|Column|Type|Options|
|------|----|-------|
|customer_id|string|null: false|
|card_id |string|null: false|
|user|references|null:false, foreign_key:true|

### Association
- belongs_to:user



### itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|introduction|text|null:false|
|price|integer|null:false|
|condition_id|integer|null:false|
|size_id|integer|null:false|
|category|references|null:false, foreign_key:true|
|brand|string|-------|
|prefecture_id|integer|null:false|
|shipping_cost_id|integer|null:false|
|shipping_days_id|integer|null:false|
|user|references|null:false, foreign_key:true|

### Association
- has_many :comments
- has_many :favorites
- has_one :order
- has_many :images
- belongs_to :category
- belongs_to :user
- belongs_to_active_hash :size_id
- belongs_to_active_hash :prefecture_id
- belongs_to_active_hash :shipping_cost_id
- belongs_to_active_hash :shipping_days_id



### imagesテーブル
|Column|Type|Options|
|------|----|-------|
|url|string|null:false|
|item|references|null:false, foreign_key:true|

### Association
- belongs_to :item



### favoritesテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null:false, foreign_key:true|
|item|references|null:false, foreign_key:true|

### Association
- belongs_to :user
- belongs_to :item



### commentsテーブル
|Column|Type|Options|
|------|----|-------|
|comment|text|null:false|
|user|references|null:false, foreign_key:true|
|item|references|null:false, foreign_key:true|

### Association
- belongs_to :user
- belongs_to :item



### categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|ancestry|string|null:false|

### Association
- has_many :items
- has_ancestry

### ordersテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null:false, foreign_key:true|
|item|references|null:false, foreign_key:true|

### Association
- belongs_to :user
- belongs_to :item