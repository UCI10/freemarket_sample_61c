class ProductsController < ApplicationController
  before_action :sell, only: [:new, :edit]

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
