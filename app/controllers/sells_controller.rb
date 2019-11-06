class SellsController < ApplicationController
  before_action :category_set, only: [:new, :edit]

  def index

  end

  def new
    @product = Product.new
  end

  def create
    # Product.create(create_params)

    # Product.create(title: product_params[:title], description: product_params[:description], user_id: current_user.id)
    # binding.pry
    @product = Product.create(create_params)
    # if @product.save
    #   redirect_to root_path
    # else
    #   redirect_to action: :new
    # end
  end

  private  

  def category_set
    @category = Category.where(ancestry: nil) 
  end

  def product_params
    params.permit(:title, :description)
  end

  def image_params
    params.require(:image).permit({images:[]})
  end  

  def create_params
    params.require(:product).permit(:title, :discription).merge(user_id: current_user.id)
  end


end
