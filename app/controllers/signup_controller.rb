class SignupController < ApplicationController
  before_action :validates_step1, only: :step2
  before_action :validates_step2, only: :step3

  before_action :validates_step3, only: :step4
  before_action :validates_step4, only: :create

  def validates_step4
    session[:card_id] = card_params[:card_id]
    session[:security_code] = card_params[:security_code]
    session[:month] = card_params[:month]
    session[:year] = card_params[:year]
  
    @card = Card.new(
      card_id: session[:card_id],
      security_code: session[:security_code],
      month: session[:month],
      year: session[:year]
    )
    render '/signup/step4' unless @card.valid?
  end

  def validates_step3

    session[:postalcode] = params[:postalcode]
    session[:city] = params[:city]
    session[:house_number] = params[:house_number]
    session[:building_name] = params[:building_name]
    session[:prefectures] = address_params[:prefectures]

 
    # バリデーション用に、仮でインスタンスを作成する
    @address = Address.new(
      postalcode: session[:postalcode], # sessionに保存された値をインスタンスに渡す
      city: session[:city],
      house_number: session[:house_number],
      prefectures: session[:prefectures],

    )
    # 仮で作成したインスタンスのバリデーションチェックを行う
    render '/signup/step3' unless @address.valid?
    
  
  end



  # 各アクションごとに新規インスタンスを作成します
  # 各アクションごとに、遷移元のページのデータをsessionに保管していきます
def step1
  @user = User.new # 新規インスタンス作成
end

# before_actionごとに、遷移元のページのデータをsessionに保管していきます
  # 仮でインスタンスを作成しバリデーションチェックを行います
  def validates_step1
    # step1で入力された値をsessionに保存
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    session[:last_name] = user_params[:last_name]
    session[:first_name] = user_params[:first_name]
    session[:last_name_phonetic] = user_params[:last_name_phonetic]
    session[:first_name_phonetic] = user_params[:first_name_phonetic]
  
    session[:birth_year] = user_params[:birth_year]
    session[:birth_month] = user_params[:birth_month]
    session[:birth_day] = user_params[:birth_day]
    # バリデーション用に、仮でインスタンスを作成する
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
      birth_day: session[:birth_day]

    )
    # 仮で作成したインスタンスのバリデーションチェックを行う

    render '/signup/step1' unless @user.valid?(:validates_step1)

    
  
  end

def step2

  
  @user = User.new # @u新規インスタンス作成

end



  def validates_step2
    # step2で入力された値をsessionに保存
    # session[:phone_number] = user_params[:phone_number]
    # バリデーション用に、仮でインスタンスを作成する
    session[:phone_number] = user_params[:phone_number]

    @user = User.new(
      phone_number: session[:phone_number],
      email: session[:email],
      password: session[:password],
      # password_confirmation: session[:password_confirmation]

    )
    # 仮で作成したインスタンスのバリデーションチェックを行う

   

  render '/signup/step2' unless @user.valid?(:validates_step2)

  end 



def step3

  @address = Address.new

end

def step4

@card = Card.new

end


def create



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
  
    @card = Card.new(
      user_id: @user.id,
      card_id: session[:card_id],
      security_code: session[:security_code],
      month: session[:month],
      year: session[:year]
    )
  
    @card.save


   
    @address = Address.new(
      user_id: @user.id,
      postalcode: session[:postalcode],
      city: session[:city],
      house_number: session[:house_number],
      building_name: session[:building_name],
      prefectures: session[:prefectures]    
    )



    @address.save

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
      :prefectures
      # :postalcode,
      # :city,
      # :house_number,
      # :building_name
    )

  end

  def card_params
    params.require(:card).permit(
      :card_id,
      :year,
      :month,
      :security_code
    )
  end
end