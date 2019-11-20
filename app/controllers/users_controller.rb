class UsersController < ApplicationController
  # ログイン画面への遷移ができないため一時的にコメントアウトします。あとで外しましょう。
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


  
  


  private
  def move_to_tops_index
    redirect_to controller: :tops, action: :index unless user_signed_in?
  end
end
