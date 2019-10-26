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
  |birth_year|string|null: false|
  |birth_month|string|null: false|
  |birth_day|string|null: false|
  |first_name|string|null: false|
  |last_name|string|null: false|
  |first_name_phonetic|string|null: false|
  |last_name_phonetic|string|null: false|
  |avatar|string||
  |point|integer||


  <!-- 商品、いいね、コメント、取引グループ(取引後のメッセージ送信に使用)、取引中のメッセージ、所持ポイント、クレジットカード、レビュー -->
  ### Association
  - has_many :products
  - has_many :likes
  - has_many :comments
  - has_many :trades_users
  - has_many :trades, through: :trades_users
  - has many :messages
  - has many :points
  - has many :credit-cards
  - has many :reviews


  <!-- 郵便番号、都道府県、市町村区、番地、マンション名や号室、電話番号 -->
  ## adresssテーブル

  |Column|Type|Options|
  |------|----|-------|
  |postalcode|integer|null: false|
  |prefecture|string|null: false|
  |city|string|null: false|
  |housenumber|string|null: false|
  |buildingname|string||
  |phonenumber|integer|null: false|

  ### Association
  - belongs_to :user

  <!-- タイトル、画像、詳細、商品状態、配送負担（出品者購入者）、発送方法、発送元地域、発送までの日数値段、サイズ、他 -->
  ## productsテーブル

  |Column|Type|Options|
  |------|----|-------|
  |user_id|references|null: false, foreign_key|
  |category_id|references|null: false, foreign_key|
  |shipping_id|references|null: false, foreign_key|
  |brand_id|references|null: false, foreign_key|
  |trade_id|references|null: false, foreign_key|
  |title|text|null: false|
  |detail|text|null: false|
  |condition|string|null: false|
  |shippingburden|string|null: false, foreign_key: true|
  |method|string|null: false, foreign_key|
  |area|string|null: false, foreign_key|
  |shipping_period|string|null: false, foreign_key|
  |price|integer|null: false|
  |size|string||


  ### Association
  - belongs_to :user
  - has_many :categories, dependent: :destroy
  - has_many :brands, dependent: :destroy
  - has_many :likes, dependent: :destroy
  - has_many :comments, dependent: :destroy
  - has_many :images, dependent: :destroy
  - has_one :shipping
  - belongs_to :trade

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
  |name|string|null: false|

  ### Association
  - has_many :trades_users
  - has_many :users, through: :trades_users
  - has_many :messages

  <!-- belongs_to :productが必要かもしれない -->


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
  |cardnumber|integer|null: false, unique: true|
  |expirationdate|integer|null: false, unique: true|

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
  |initial-a|string||
  |initial-b|string||

  ### Association
  - belongs_to :brand
