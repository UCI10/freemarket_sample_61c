class SignupController < ApplicationController

  # 各アクションごとに新規インスタンスを作成します
  # 各アクションごとに、遷移元のページのデータをsessionに保管していきます
def step1
  @user = User.new # 新規インスタンス作成
end

def step2
  # step1で入力された値をsessionに保存
  session[:nickname] = user_params[:nickname]
  session[:email] = user_params[:email]
  session[:password] = user_params[:password]
  session[:password_confirmation] = user_params[:password_confirmation]

  # step1で入力された値をsessionに保存
  session[:last_name] = user_params[:last_name]
  session[:first_name] = user_params[:first_name]
  session[:last_name_phonetic] = user_params[:last_name_phonetic]
  session[:first_name_phonetic] = user_params[:first_name_phonetic]

  session[:birth_year] = user_params[:birth_year]
  session[:birth_month] = user_params[:birth_month]
  session[:birth_day] = user_params[:birth_day]
  @user = User.new # 新規インスタンス作成
end

def step3

  # step2で入力された値をsessionに保存
  # session[:last_name] = user_params[:last_name]
  # session[:first_name] = user_params[:first_name]
  # session[:last_name_kana] = user_params[:last_name_kana]
  # session[:first_name_kana] = user_params[:first_name_kana]

  session[:phone_number] = user_params[:phone_number]

  @user = User.new # 新規インスタンス作成
  @address = Address.new

end

def step4

  # session[:last_name] = user_params[:last_name]
  # session[:first_name] = user_params[:first_name]
  # session[:last_name_phonetic] = user_params[:last_name_phonetic]
  # session[:first_name_phonetic] = user_params[:first_name_phonetic]

  session[:postalcode] = address_params[:postalcode]
  session[:city] = address_params[:city]
  session[:house_number] = address_params[:house_number]
  session[:building_name] = address_params[:building_name]
  session[:prefecture] = address_params[:prefecture]

  # @user = User.new(
  #   nickname: session[:nickname], # sessionに保存された値をインスタンスに渡す
  #   email: session[:email],
  #   password: session[:password],
  #   password_confirmation: session[:password_confirmation],
  #   last_name: session[:last_name], 
  #   first_name: session[:first_name], 
  #   last_name_kana: session[:last_name_kana], 
  #   first_name_kana: session[:first_name_kana],
  #   birth_year: session[:birth_year],
  #   birth_month: session[:birth_month],
  #   birth_day: session[:birth_day],
  #   phone_number: session[:phone_number]

  # )
#   if @user.save
# # ログインするための情報を保管
#     session[:id] = @user.id
#     redirect_to done_signup_index_path
#   else
#     render '/signup/entry_signup'
#   end

  #カードのアソシエーションを組むこと。
@card = Card.new

end


def create

  session[:card_id] = card_params[:card_id]
  session[:security_code] = card_params[:security_code]
  session[:month] = card_params[:month]
  session[:year] = card_params[:year]
    security_code: session[:security_code],



  

  @user = User.new(
    nickname: session[:nickname], # sessionに保存された値をインスタンスに渡す
    email: session[:email],
    password: session[:password],
    password_confirmation: session[:password_confirmation],
    last_name: session[:last_name], 
    first_name: session[:first_name], 
    last_name_phonetic: session[:last_name_phonetic], 
    first_name_phonetic: session[:first_name_phonetic],
    birth_year: session[:birth_year],
    birth_month: session[:birth_month],
    birth_day: session[:birth_day],
    phone_number: session[:phone_number]

  )

  if @user.save
# ログインするための情報を保管
    session[:id] = @user.id
 


    @address = Address.new(
      user_id: session[:id],
      postalcode: session[:postalcode],
      city: session[:city],
      house_number: session[:house_number],
      building_name: session[:building_name],
      prefectures: session[:prefectures]    
    )

    @address.save

    @card = Card.new(
      user_id: session[:id],
      card_id: session[:card_id],
      security_code: session[:security_code],
      month: session[:month],
      year: session[:year]
    )
  
    @card.save

    redirect_to done_signup_index_path

    
  else
    render '/signup/entry_signup'
  end
end

    def done
      sign_in User.find(session[:id]) unless user_signed_in?
    end


  private

  def user_params
    params.require(:user).permit(
      :nickname, 
      :email, 
      :password, 
      :password_confirmation, 

      :last_name, 
      :first_name, 
      :last_name_phonetic, 
      :first_name_phonetic,

      :phone_number,

      :birth_year,
      :birth_month,
      :birth_day

 
 
    )
  end

  def address_params
    params.require(:address).permit(
      :prefectures,
      :postalcode,
      :city,
      :house_number,
      :building_name
    )

  end

  def card_params
    params.require(:card).permit(
      
      :card_id,
      :year,
      :month,
      :security_coad
    )
  end
end