class ProductsController < ApplicationController
  before_action :sell, only: [:new, :edit]

  def pay
    Payjp.api_key = 'sk_test_0ddb364bab7ed621b29956cb'
    charge = Payjp::Charge.create(
    :amount => @product.price,
    :card => params['payjp-token'],
    :currency => 'jpy',
  )
  end

 def purchase
  @product = Product.new(id: 1)
 end

  def index
    @product = Product.all.order("created_at DESC")
  
  end

  def new
    @product = Product.new
    @product.images.build    

  end

  def create
    @product = Product.new(product_params)
    
    if @product.save

    else
      @product.images.build 
      render action: :new
    end


  end
  
  def show
    # @products = Product.all
    @product = Product.new
    @product.images.build    
  end


  def show

  end


private  

  def product_params
    params.require(:product).permit(:title, :description, :category_id, :brand_id, :size, :brand_id, :condition, :shipping_burden, :shipping_area, :shipping_method, :shipping_period, :price, :buyer_id, :created_at, :updated_at, images_attributes: [:image_url, :id]).merge(user_id: current_user.id)
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
