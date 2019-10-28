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


  <!-- ニックネーム、メールアドレス、パスワード、生年月日、苗字名前フリガナ（カタカナ）、アバター画像 -->
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
  |payment_method|string|null: false|


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
  ## adressテーブル

  |Column|Type|Options|
  |------|----|-------|
  |phone_number|integer|null: false, unique: true|
  |postalcode|integer|null: false|
  |prefecture|string|null: false|
  |city|string|null: false|
  |house_number|string|null: false|
  |building_name|string||


### Association
- belongs_to :user

  <!-- タイトル、画像、詳細、商品状態、配送負担（出品者購入者）、発送方法、発送元地域、発送までの日数値段、サイズ、他 -->
  ## productsテーブル

  |Column|Type|Options|
  |------|----|-------|
  |user_id|references|null: false, foreign_key|
  |shipping_id|references|null: false, foreign_key|
  |brand_id|references|null: false, foreign_key|
  |trade_id|references|null: false, foreign_key|
  |title|text|null: false, add_index|
  |detail|text|null: false|
  |condition|string|null: false|
  |shipping_burden|integer|null: false|
  |shipping_method|integer|null: false|
  |area|integer|null: false|
  |shipping_period|string|null: false, foreign_key|
  |likes_count|integer|null: false|
  |price|integer|null: false|
  |category_id|integer|null: false, foreign_key|
  |size_id|integer|null: false, foreign_key|
  |brand_id|integer|null: false, foreign_key|


### Association
- belongs_to :user
- belongs_to :category
- belongs_to :size
- belongs_to :brands
- has_many :likes, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :images, dependent: :destroy
- has_one :shipping
- belongs_to :trade
- has_many :buyer_trades, class_name: 'Trade', foreign_key: :buyer_id, dependent: :destroy
- has_many :seller_deals, class_name: 'Trade', foreign_key: :seller_id, dependent: :destroy
- has_many :seller, class_name: 'User', foreign_key: :seller_id, through: :trades
- has_many :buyer, class_name: 'User', foreign_key: :buyer_id, through: :trades
- has many :messages

### enum

- condition
- area
- shipping_burden
- shipping_method
- shipping_period


  ## imagesテーブル

  |Column|Type|Options|
  |------|----|-------|
  |products_id|integer|null: false, foreign_key: true|
  |image_url|text|null: false|


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
  ## credit-cardsテーブル

  |Column|Type|Options|
  |------|----|-------|
  |card_number|integer|null: false, unique: true|
  |expiration_date|integer|null: false, unique: true|

  ### Association
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


  ## pointsテーブル

  |Column|Type|Options|
  |------|----|-------|
  |point|integer||

  ### Association
  - belongs_to :user



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

  <!-- ancesstoryのgem -->


  ブランド
  ## brandsテーブル

  |Column|Type|Options|
  |------|----|-------|
  |luis-vutton|string||

  ### Association
  - belongs_to :product
  - has_many :brands-initials


  ## brands-initialsテーブル

  |Column|Type|Options|
  |------|----|-------|
  |initial_a|string||
  |initial_b|string||

  ### Association
  - belongs_to :brand
