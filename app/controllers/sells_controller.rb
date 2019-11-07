class SellsController < ApplicationController
  # before_action :category_set, only: [:new, :edit]

  def index

  end

  def new
    if user_signed_in?
      @product = Product.new
      @product.images.build  
      # 10.times{@product.images.build}
    else
      redirect_to new_user_session_path
    end  

  end

  def create
    # Product.create(create_params)

    # Product.create(title: product_params[:title], description: product_params[:description], user_id: current_user.id)
    # binding.pry
    # @product = Product.create(product_params)
    @product = Product.new(product_params)
    if @product.save
      # redirect_to root_path
    else
      redirect_to action: :new
    end
    # @product.images.build   
    # image = @product.images.new(image_url: image_url)
    # image.save

    # if @product.save
    #   redirect_to root_path
    # else
    #   redirect_to action: :new
    # end
  end
  
  # def show
  #   @product = Product.new
  #   @product.images.build    
  # end

  def sell
    @product= Product.new()
    @parent = Category.where(ancestry: nil)
    @children = Category.none
    @grandchildren = Category.none
    @product.images.build
  end 


private  

  def product_params
    params.require(:product).permit(:title, :description, :category_id, :brand_id, :size, :brand_id, :condition, :shipping_burden, :shipping_area, :shipping_method, :shipping_period, :price, :buyer_id, :created_at, :updated_at, images_attributes: [:image_url, :id]).merge(user_id: current_user.id)
  end

  def image_params
    params.require(:image).permit({images:[]})
  end  

  def create_params
    params.require(:product).permit(:title, :description, :category_id, :brand_id, :size, :brand_id, :condition, :shipping_burden, :shipping_area, :shipping_method, :shipping_period, :price, :buyer_id, :created_at, :updated_at, images_attributes: [:image_url, :id]).merge(user_id: current_user.id)
  end

  def product_set
    @product = Product.find(params[:id])
  end



end
