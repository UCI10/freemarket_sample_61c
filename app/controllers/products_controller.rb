class ProductsController < ApplicationController
  before_action :parent_set, only: [:new, :edit, :create]
  before_action :brand_parent_set, only: [:new, :edit, :create]
  before_action :brand_child_set, only: [:new, :edit, :create]

  # before_action :get_category_children, only: [:new, :edit, :create]カテゴリボックスのデータ送信が未完成ですのでコメントアウトします
  require 'payjp'

  def pay
    Payjp.api_key = 'sk_test_0ddb364bab7ed621b29956cb'
    charge = Payjp::Charge.create(
    # :amount => @product.price,
    amount: 809, # 決済する値段
    :card => params['payjp-token'],
    :currency => 'jpy',
  )
  end

 def purchase
  @product = Product.find(params[:id])

 end

  def index
    @products = Product.all.order("created_at DESC").limit(10)
  
  end

  def new
      @product = Product.new
      @parents = Category.all.order("id ASC").limit(8)
      @product.images.build
      
    # TODO   @category_parent_array = ["---"]
    #   Category.where(ancestry: nil).each do |parent|
    #   @category_parent_array << parent.name
    #  end

    # @product = Product.new
    # @product.images.build  
  

  end

    
   # 以下全て、formatはjsonのみ
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

 def select_category_m
  parent = Category.find_by(id: params[:category_id_parent])
  @children = parent.children
  respond_to do |format|
    format.json
  end
end
def select_category_s
  child= Category.find_by(id: params[:category_id_child])
  @grandchildren = child.children
  respond_to do |format|
    format.json
  end
end

  def create
    @product = Product.new(product_params)
    # respond_to do |format|JSのデータsave時の情報送信のif文条件分岐が未完成のため
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
      # format.html { redirect_to root_path(@product) }
    end

  end
  
  def show
    @product = Product.find(params[:id])
    if @product.user_id == current_user.id
      render :showmine
    end
  end

  def destroy
    product = Product.find(params[:id])
    if product.user_id == current_user.id
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
    @product = Product.find(params[:id])
    @length =@product.images.length

    
    # @length =@product.images.length 
    # if @length == 1
    #   4.times{@product.images.build}
    # elsif @length == 2
    #   3.times{@product.images.build}
    # elsif @length == 3
    #   2.times{@product.images.build}
    # elsif @length == 4
    #   1.times{@product.images.build}
    # end


    @selected_grandchild_category = @product.category
    @category_grandchildren_array = [{id: "---", name: "---"}]
    Category.find("#{@selected_grandchild_category.id}").siblings.each do |grandchild| #siblingsで同じ階層の要素をすべて取得
      grandchildren_hash = {id: "#{grandchild.id}", name: "#{grandchild.name}"}
      @category_grandchildren_array << grandchildren_hash
    end
    @selected_child_category = @selected_grandchild_category.parent
    @category_children_array = [{id: "---", name: "---"}]
    Category.find("#{@selected_child_category.id}").siblings.each do |child|
      children_hash = {id: "#{child.id}", name: "#{child.name}"}
      @category_children_array << children_hash
    end
    @selected_parent_category = @selected_child_category.parent
    @category_parents_array = [{id: "---", name: "---"}]
    Category.find("#{@selected_parent_category.id}").siblings.each do |parent|
      parent_hash = {id: "#{parent.id}", name: "#{parent.name}"}
      @category_parents_array << parent_hash
    end


    @category = @product.category
    @parents = @product.category.parent
    @parents_sib =@parents.siblings
    @grands = @product.category.root
    @grands_sib = @grands.siblings

    @category_grandchildren  = Category.where(id: @product.category_id)
    @category_children     = Category.where(id: @category_grandchildren[0].parent)
    @parent         = Category.where(ancestry: nil)
    @parent_current = Category.find_by(id: @category_children[0].parent.id)
    redirect_to root_path unless @product.user_id == current_user.id
  

  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to action: :show
       
      # redirect_to root_path
    else
      redirect_to action: 'edit'
    end
  end

  # def edit
  # end
  # def search カテゴリボックスの仕様変更の可能性があるのでその際のためのコメントアウトです
  #   respond_to do |format|
  #     format.html
  #     format.json do
  #      @children = Category.find(params[:parent_id]).children
  #      #親ボックスのidから子ボックスのidの配列を作成してインスタンス変数で定義
  #      @indirects = Category.find(params[:parent_id]).indirects

  #     end
  #   end
  # end


private  

  def product_params
    params.require(:product).permit(:title, :description, :category_id, :brand_id, :size, :brand_id, :condition, :shipping_burden, :shipping_area, :shipping_method, :shipping_period, :price, :buyer_id, :created_at, :updated_at, images_attributes: [:image_url, :id]).merge(user_id: current_user.id)
  end

  def new_image_params
    params[:new_images].permit({images: []})
  end

  def parent_set
  @category_parent_array = ["---"]
  # @category_parent_id_array = ["---"]
  Category.where(ancestry: nil).each do |parent|
  @category_parent_array << parent.name
  # @category_parent_id_array << parent.id
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

  # def category_set
  #   @category = Category.where(ancestry: nil) 
  # end

  def sell
    @category = Category.where(ancestry: nil) 

  end 

end
