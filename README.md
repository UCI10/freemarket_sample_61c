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


## usersテーブル

|Column|Type|Options|
|------|----|-------|
<!-- ニックネーム、メールアドレス、パスワード -->
|nickname|string|null: false|
|email|string|null: false, unique: true|
|encrypted_password|string|null: false, unique: true|
<!-- 生年月日 -->
|BirthYear|string|null: false|
|BirthMonth|string|null: false|
|BirthDay|string|null: false|
<!-- 苗字名前フリガナ（カタカナ） -->
|Firstname|string|null: false|
|Lastname|string|null: false|
|FirstNamePhonetic|string|null: false|
|LasttNamePhonetic|string|null: false|
<!-- 郵便番号、都道府県、市町村区、番地、マンション名や号室 -->
|PostalCode|integer|null: false|
|Prefecture|string|null: false|
|City|string|null: false|
|HouseNumber|string|null: false|
|BuildingName|string||
<!-- 電話番号 -->
|PhoneNumber|integer|null: false|
<!-- アバター画像 -->
|avatar|string||
|point|integer||

<!-- 今後必要かもしれないもの -->
<!-- |review_id|references||


### Association

<!-- 商品 -->
- has_many :products
<!-- いいね -->
- has_many :likes
<!-- コメント -->
- has_many :comments
<!-- 取引グループ(取引後のメッセージ送信に使用) -->
- has_many :trades_users
- has_many :trades, through: :trades_users
<!-- 取引中のメッセージ -->
- has many :messages
<!-- 所持ポイント -->
- has many :points
<!-- やることリスト -->
- has many :ToDoLists

## :productssテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key|
|category_id|references|null: false, foreign_key|
|shipping_id|references|null: false, foreign_key|
|brand_id|references|null: false, foreign_key|
|trade_id|references|null: false, foreign_key|
<!-- タイトル、画像、詳細、商品状態、値段、サイズ -->
|title|text|null: false|
|image_url|text|null: false|
|detail|text|null: false|
|condition|string|null: false|
|price|integer|null: false|
|size|string||

### Association
- belongs_to :user
- has_many :categories
- has_many :brands
- has_many :likes
- has_many :comments
- has_one :shipping
- has_one :trading

## likesテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer||
|products_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key|

### Association
- belongs_to :user
- belongs_to ::products

<!-- 取引グループ(取引後のメッセージ送信に使用)chatspaceでのグループテーブルの役割 -->
## tradesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :trades_users
- has_many :users, through: :trades_users
- has_many :messages

## trades_usersテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|trade_id|references|null: false, foreign_key: true|

### Association
- belongs_to :trade
- belongs_to :user

## messagesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key|
|trade_id|integer|null: false, foreign_key|
|content|text||
|image|string||

### Association
- belongs_to :trade
- belongs_to :user

## shippingsテーブル

|Column|Type|Options|
|------|----|-------|
<!-- 配送負担（出品者購入者） -->
|ShippingBurden|string|null: false, foreign_key: true|
<!-- 発送方法 -->
|method|string|null: false, foreign_key|
<!-- 発送元地域 -->
|area|string|null: false, foreign_key|
<!-- 発送までの日数 -->
|shipping_period|string|null: false, foreign_key|

### Association
- belongs_to :product


## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key|
|product_id|references|null: false, foreign_key|
|content|text|null: false|

### Association
- belongs_to :user
- belongs_to :product


## credit-cardsテーブル

|Column|Type|Options|
|------|----|-------|
<!-- クレジットカードナンバー -->
|Cardnumber|integer|null: false, unique: true|
<!-- 有効期限 -->
|ExpirationDate|integer|null: false, unique: true|

### Association
- belongs_to :user

## reviewsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key|
|product_id|references|null: false, foreign_key|
|rate|integer|null: false|
|review|text|null: false|

### Association
- belongs_to :user
- belongs_to :product


<!-- ブランドやカテゴリは少しだけ設定 -->

## categoriesテーブル(経路列挙モデル)

|Field|Type|Options|
|------|----|-------|
|id|integer|null: false|
|path|text||
|name|text|null: false, foreign_key|

|id|path|name|
|------|----|-------|
|1|1/|categories|
|1|1/2|ladies|
|1|1/3|mens|
|1|1/2/1|tops|
|1|1/2/2|JacketOuter|
|1|1/2/3|pants|
|1|1/2/4|skirt|
|1|1/3/1|tops|
|1|1/3/2|JacketOuter|

### Association
belongs_to :product


## brandsテーブル

|Column|Type|Options|
|------|----|-------|
<!-- ブランド -->
|luis-vutton|string||

### Association
- belongs_to :product
- has_many :brand-groups

## brands-initialテーブル

|Column|Type|Options|
|------|----|-------|
<!-- ブランド -->
|initial-a|string||

### Association
- belongs_to :brand







<!-- 今後必要かもしれないもの -->
<!-- middle-categoriesテーブル（経路列挙モデルで作成する場合は不要になる）
small-categoriesテーブル（経路列挙モデルで作成する場合は不要になる） -->

<!-- 履歴テーブル -->
<!-- ## Historyテーブル

|Column|Type|Options|
|------|----|-------|
<!-- 売上金 -->
<!-- |sales|integer||

### Association
- belongs_to :user -->





