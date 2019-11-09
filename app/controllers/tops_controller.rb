class TopsController < ApplicationController

  def index
    @product = Product.all.order("created_at DESC")
  end

  def show
  end

end
