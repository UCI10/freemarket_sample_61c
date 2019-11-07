class ProductsController < ApplicationController
  def index

  end

  def create
    Product.create(title: product_params[:title], description: product_params[:description])
    # , user_id: current_user.id
    # @product = Product.new(product_params)
    if params[:image].present? && @product.save
      image_params[:images].each do |image|
      @product.images.build
      image = @product.images.new(image: image)
      image.save
      end
    end
  end  

  def new
  end
  
  def show

  end


private  

  def product_params
    params.permit(:title, :description)
  end

  def image_params
    params.require(:image).permit({images:[]})
  end  


end
