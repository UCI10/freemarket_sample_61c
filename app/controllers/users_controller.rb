class UsersController < ApplicationController
  # before_action :move_to_tops_index
  # before_action :authenticate_user!

  def index
  end
  

  def show
  end

  def logout
  end

  def profile
  end

  def creditdisplay
  end

  def identification 
  end

  def listing
  end

  private
  def move_to_tops_index
    redirect_to controller: :tops, action: :index unless user_signed_in?
  end
end
