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


  <!-- ニックネーム、メールアドレス、パスワード、プロフィール、生年月日、苗字名前、フリガナ（カタカナ）、アバター画像、所持ポイント、支払い方法 -->
  ## usersテーブル

  |Column|Type|Options|
  |------|----|-------|
  |nickname|string|null: false|
  |email|string|null: false, unique: true|
  |encrypted_password|string|null: false, unique: true|
  |profile|text||
  |birth_year|string|null: false|
  |birth_month|string|null: false|
  |birth_day|string|null: false|
  |first_name|string|null: false|
  |last_name|string|null: false|
  |first_name_phonetic|string|null: false|
  |last_name_phonetic|string|null: false|
  |avatar|string||
  |point|integer||
  |payment_method|string|
  |phone_number|integer|null: false, unique: true|
  |provider|string||
  |uid|string||


  <!-- 商品、いいね、コメント、取引グループ(取引後のメッセージ送信に使用)、取引中のメッセージ、所持ポイント、クレジットカード、レビュー -->
  ### Association
  - has_many :products, through: :trades
  - has_many :buyer_trades, class_name: 'Trade', foreign_key: :buyer_id, dependent: :destroy
  - has_many :seller_trades, class_name: 'Trade', foreign_key: :seller_id, dependent: :destroy
  - has_many :likes, dependent: :destroy
  - has_many :comments, dependent: :destroy
  - has many :points
  - has many :credit-cards
  - has many :reviews, dependent: :destroy
  - has many :adress




### enum

- status
- prefecuture
- expense
- shipping_method
- arrival_date



  <!-- 郵便番号、都道府県、市町村区、番地、マンション名や号室、電話番号 -->
  ## addressテーブル

  |Column|Type|Options|
  |------|----|-------|
  |user|references|null: false, foreign_key: true|
  |postalcode|integer|null: false|
  |prefectures|integer|null: false|
  |city|string|null: false|
  |house_number|string|null: false|
  |building_name|string||


### Association
- belongs_to :user

## enum
- prefectures


  <!-- タイトル、画像、詳細、商品状態、配送負担（出品者購入者）、発送方法、発送元地域、発送までの日数値段、サイズ、他 -->
  ## productsテーブル

  |Column|Type|Options|
  |------|----|-------|
  |user|references|null: false, foreign_key: true|
  |category|references|null: false, foreign_key|
  |brand|references|null: false, foreign_key|
  |title|string|null: false, add_index|
  |description|text|null: false|
  |condition|string|null: false|
  |shipping_burden|integer|null: false|
  |shipping_method|integer|null: false|
  |shipping_area|integer|null: false|
  |shipping_period|integer|null: false, foreign_key|
  |price|integer|null: false|
  |size_id|integer|null: false, foreign_key|
  |brand_id|integer|null: false, foreign_key|
  |buyer_id|integer||

  <!-- まだ必要じゃないもの -->
  <!-- |likes_count|integer|null: false| -->
  <!-- |trade_id|references|null: false, foreign_key| -->



### Association
- belongs_to :user
- belongs_to :category
- belongs_to :brand
- has_many :likes, dependent: :delete_all
- has_many :comments, dependent: :destroy
- has_many :images, dependent: :destroy
- belongs_to :trade
- has_many :buyer_trades, class_name: 'Trade', foreign_key: :buyer_id, dependent: :destroy
- has many :messages

<!-- - belongs_to :buyer, class_name: "User", optional: true
- has_many :seller_deals, class_name: 'Trade', foreign_key: :seller_id, dependent: :destroy
- has_many :seller, class_name: 'User', foreign_key: :seller_id, through: :trades
- has_many :buyer, class_name: 'User', foreign_key: :buyer_id, through: :trades -->

### enum

- condition
- shipping_area
- shipping_burden
- shipping_method
- shipping_period
- size


  ## imagesテーブル

  |Column|Type|Options|
  |------|----|-------|
  |products|references|null: false, foreign_key: true, on_delete: :cascade|
  |image_url|string|null: false|


  ### Association
  - belongs_to :product


  ## likesテーブル

  |Column|Type|Options|
  |------|----|-------|
  |id|integer||
  |products_id|integer|null: false, foreign_key: true|
  |user_id|integer|null: false, foreign_key|

  ### Association
  - belongs_to :user
  - belongs_to :product


  <!-- 取引グループ(取引後のメッセージ送信に使用)chatspaceでのグループテーブルの役割 -->
  ## tradesテーブル

  |Column|Type|Options|
  |------|----|-------|
  |product_id|integer|null: false, foreign_key: true|
  |seller_id|integer|null: false, foreign_key: true|
  |buyer_id|integer|null: false, foreign_key: true|

  ### Association
  - has_one :review
  - belongs_to :product
  - belongs_to :seller, class_name: 'User', foreign_key: :seller_id
  - belongs_to :buyer, class_name: 'User', foreign_key: :buyer_id
  - has_many :messages
<!-- belongs_to :productが必要かもしれない -->

<!-- 取引でのメッセージ -->
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

<!-- 商品へのコメント -->
  ## commentsテーブル

  |Column|Type|Options|
  |------|----|-------|
  |user_id|references|null: false, foreign_key|
  |product_id|references|null: false, foreign_key|
  |content|text|null: false|

  ### Association
  - belongs_to :user
  - belongs_to :product


  <!-- クレジットカードナンバー、有効期限 -->
  ## cardsテーブル

  |Column|Type|Options|
  |------|----|-------|
  |user|references|null: false, foreign_key, on_delete: :cascade|
  |card_id|integer|null: false|
  |year|integer|null: false|
  |month|integer|null: false|  
  |security_code|integer|null: false|  
 

  ### Association
  - belongs_to :user

  ## paysテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|
|card_id|integer|null: false|
|customer_id|string||


## Association
- belongs_to :user


  ## reviewsテーブル

  |Column|Type|Options|
  |------|----|-------|
  |rate|integer|null: false|
  |trade_id|integer|null: false,foreign_key: true|
  |reviewer_id|integer|null: false, foreign_key|
  |reviewed_id|integer|null: false, foreign_key|
  |review|text|null: false|

  ### Association
  - belongs_to :trade
  - belongs_to :reviewer, class_name: 'User'
  - belongs_to :reviewed, class_name: 'User'

   ### enum

   - rate


   ### enum
   
   - rate

  ## pointsテーブル

  |Column|Type|Options|
  |------|----|-------|
  |user_id|references|null: false, foreign_key|
  |point|integer||

  ### Association
  - belongs_to :user


  <!-- ブランドやカテゴリは少しだけ設定 -->
  <!-- ancestryというgemを使います -->
  ## categoriesテーブル(経路列挙モデル)

  |Field|Type|Options|
  |------|----|-------|
  |id|integer|null: false|
  |path|integer||
  |name|string|null: false, foreign_key|

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

  <!-- ancesstoryのgem -->


   <!-- ブランドやカテゴリは少しだけ設定 -->
  <!-- ancestryというgemを使います -->
  ## brandsテーブル

  |Column|Type|Options|
  |------|----|-------|
  |name|string|null: false|

  ### Association
  - has_many :products

