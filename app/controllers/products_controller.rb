class ProductsController < ApplicationController
  before_action :parent_set, only: [:new, :edit]
  # before_action :get_category_children, only: [:new, :edit]

  def index
    @product = Product.all.order("created_at DESC")
  end

  def new
      @product = Product.new
      @product.images.build  
      @parents = Category.all.order("id ASC").limit(8)
    # TODO   @category_parent_array = ["---"]
    #   Category.where(ancestry: nil).each do |parent|
    #   @category_parent_array << parent.name
    #  end

    # @product = Product.new
    # @product.images.build  
  

  end

  def create
    @product = Product.new(product_params)
    respond_to do |format|
    if @product.save
       params[:images][:image_url].each do |image_url|
       @product.images.create(image_url: image_url, product_id: @product.id)

      end
      # respond_to do |format|
        format.html { redirect_to root_path(@product) }
        # format.json
      end  
    else
      @product.images.build 
      render action: :new
      # format.html { redirect_to root_path(@product) }
    end

  end
  
  def show
    @product = Product.new
    @product.images.build
  end


  def search
    respond_to do |format|
      format.html
      format.json do
       @children = Category.find(params[:parent_id]).children
       #親ボックスのidから子ボックスのidの配列を作成してインスタンス変数で定義
       @indirects = Category.find(params[:parent_id]).indirects

      end
    end
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


  def product_set
    @product = Product.find(params[:id])
  end

  def category_set
    @category = Category.where(ancestry: nil) 
  end

  def sell
    @category = Category.where(ancestry: nil) 

  end 

end
