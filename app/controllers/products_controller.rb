class ProductsController < ApplicationController

  # include CommonActions
  # before_action :set_categories

  before_action :parent_set, only: [:new, :edit, :create]
  before_action :brand_parent_set, only: [:new, :edit, :create]
  before_action :brand_child_set, only: [:new, :edit, :create]
  # product_setをbefore_actionに設定しました。担当箇所にて重複記載がありましたら消してください
  before_action :product_set, only: [:show]
  before_action :set_card, only: [:pay, :purchase]

  require 'payjp'

  def set_card
    @pay = Pay.where(user_id: current_user.id).first if Pay.where(user_id: current_user.id).present?
  end
  
  def pay
   
    @product = Product.find(params[:product_id])

    if current_user.pays.blank?
    redirect_to root_path
    else
    pay = Pay.where(user_id: current_user.id).first 
    Payjp.api_key = 'sk_test_a0947663b395402fc1e150b4'
    customer = Payjp::Customer.retrieve(pay.customer_id)
    @default_card_information = customer.cards.retrieve(pay.card_id)
    # redirect_to action: "show" if card.present?
  
    end
  end


 def purchase
  redirect_to new_user_session_path unless user_signed_in?
    # if current_user.pay.array? 
    # redirect_to  root_path 
    # else
    @product_purchaser= Product.find(params[:product_id])
    
    # @product = Product.find(params[:product_id])
   # 購入した際の情報を元に引っ張ってくる
   # テーブル紐付けてるのでログインユーザーのクレジットカードを引っ張ってくる
    Payjp.api_key = "sk_test_a0947663b395402fc1e150b4"
   # キーをセットする(環境変数においても良い)
    Payjp::Charge.create(
    amount: @product_purchaser.price, #支払金額
    customer: @pay.customer_id, #顧客ID
    currency: 'jpy', #日本円
    )
    
    @product_purchaser.update( buyer_id: current_user.id)

   # ↑商品の金額をamountへ、cardの顧客idをcustomerへ、currencyをjpyへ入れる
    # if @product.update(status: 1, buyer_id: current_user.id)
    #   flash[:notice] = '購入しました。'
    #   flash[:alert] = '購入に失敗しました。'
      redirect_to root_path
  # end
 end

  def index
    @products = Product.all.order("created_at DESC").limit(10)

    

    # @category = Category.find(1)
    # # 下記でレディースに紐付く子カテゴリーであるトップス、パンツ、靴を全て取得出来る

    # @category = Category.find(2)
    # # 下記でトップスに紐付く子カテゴリーであるTシャツ、セーター、パーカーを全て取得出来る
    # # 下記でトップスの親カテゴリーであるレディースのカテゴリーを取得出来る

    # @category = Category.find(3)
    # #下記でTシャツの親カテゴリーであるトップスのカテゴリーを取得出来る
    # @category.children = @category
    # # 下記でTシャツの親の親のカテゴリーであるレディースのカテゴリーを取得出来る



  end

  def new
      redirect_to new_user_session_path unless user_signed_in?
      @product = Product.new
      @parents = Category.all.order("id ASC").limit(8)

      @product.images.build


  end

    
   # 親カテゴリーが選択された後に動くアクション
  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

 # 子カテゴリーが選択された後に動くアクション
 def get_category_grandchildren
   #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  
  end

  def create
    @product = Product.new(product_params)

    if @product.save
       params[:images][:image_url].each do |image_url|
       @product.images.create(image_url: image_url, product_id: @product.id)
      
      end
      respond_to do |format|
        format.html { redirect_to root_path }
        format.json
      end  
    else
      @product.images.build
      render action: :new
    end

  end
  
  def show
    @product = Product.find(params[:id])


    # @user_items= Item.where(seller_id: @item.seller.id).order(“created_at DESC”).page(params[:item]).per(6)
    @user_product = Product.where(user_id: @product.user.id).where.not(id: @product.id)
      if user_signed_in? && @product.user_id == current_user.id
        render :showmine
      end
  end

  def destroy
    product = Product.find(params[:id])
    if user_signed_in? && product.user_id == current_user.id
      if product.destroy
        redirect_to root_path, notice: '商品を削除しました'
      else
        render :show
      end
    end
  end

  def showmine
    @product = Product.find(params[:id])
  end

  def edit
    @profit = (@product.price * 0.9).round
    @fee = @product.price - @profit
    # 画像の枚数取得
    @length =@product.images.length
    # 以下孫カテゴリーから親カテゴリーを辿る際の記述
    # 選択された孫カテゴリ
    @selected_grandchild_category = @product.category
    # idとnameをハッシュの配列化
    @category_grandchildren_array = [{id: "---", name: "---"}]
    #siblingsにて同じ階層の要素をすべて取得
    Category.find("#{@selected_grandchild_category.id}").siblings.each do |grandchild|
      grandchildren_hash = {id: "#{grandchild.id}", name: "#{grandchild.name}"}
      @category_grandchildren_array << grandchildren_hash
    end
    # 子カテゴリで上記と同様の記述
    @selected_child_category = @selected_grandchild_category.parent
    @category_children_array = [{id: "---", name: "---"}]
    Category.find("#{@selected_child_category.id}").siblings.each do |child|
      children_hash = {id: "#{child.id}", name: "#{child.name}"}
      @category_children_array << children_hash
    end
    # 親カテゴリで上記と同様の記述
    @selected_parent_category = @selected_child_category.parent
    @category_parents_array = [{id: "---", name: "---"}]
    Category.find("#{@selected_parent_category.id}").siblings.each do |parent|
      parent_hash = {id: "#{parent.id}", name: "#{parent.name}"}
      @category_parents_array << parent_hash
    end
        
    
    redirect_to root_path unless @product.user_id == current_user.id
  end

  def update
    if @product.update(product_params)
      redirect_to action: :show
    else
      redirect_to action: 'edit'
    end
  end

  # マージ後の実装の可否が試さないと判断できない箇所の前の設定です。マージ後問題があれば戻してください
  # def listing

  #   @products = current_user.products
  #   @product = Product.find(params[:id])
  #   # @products = Product.find(params[:id])
  #   @product.images.build
  #   # @length =@product.images.length

  #   @user_products= Product.where(user_id: @product.user.id)
  # end

  def listing

    # @products = current_user.products
    # @product = Product.find(params[:id])
    # @products = Product.find(params[:id])
    # @product.images.build
    # @length =@product.images.length

    @user_products= Product.where(user_id: current_user.id)
    render '/users/listing'
  end

private  

  def product_params
    params.require(:product).permit(:title, :description, :category_id, :brand_id, :size, :brand_id, :condition, :shipping_burden, :shipping_area, :shipping_method, :shipping_period, :price, :buyer_id, :created_at, :updated_at, images_attributes: [:image_url, :id]).merge(user_id: current_user.id)
  end

  def new_image_params
    params[:new_images].permit({images: []})
  end

  def parent_set
  @category_parent_array = ["---"]
  Category.where(ancestry: nil).each do |parent|
  @category_parent_array << parent.name
  end
  end

  def brand_parent_set
    @brand_parent_array   = []
    @brand_id_array   = []
    Brand.where(ancestry: nil).each do |brand_parent|
    @brand_parent_array << brand_parent.name
    @brand_id_array << brand_parent.id
    end
  end

  def brand_child_set
    @brand_child_array   = []
    @brand_child_id_array   = []
    Brand.where.not(ancestry: nil).each do |brand_child|
    @brand_child_array << brand_child.name
    @brand_child_id_array << brand_child.id
    end
  end


  def product_set
    @product = Product.find(params[:id])
  end

  def sell
    @category = Category.where(ancestry: nil) 

  end 

end
