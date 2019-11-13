class CardsController < ApplicationController
  require 'payjp'
  before_action :set_card

  # 後ほど登録したクレジットの表示画面を作成
  def index
    
  end

  #クレジットカード情報入力画面
  def new
    if @card
      redirect_to card_path unless @card
    else
      render 'mypages/create_card'
    end
  end

  #登録画面で入力した情報をデータベースに保存
  def create_card
    Payjp.api_key = "秘密鍵(sk_test_a0947663b395402fc1e150b4)"
    if params['payjp-token'].blank?
      render 'mypages/create_card'
    else
      customer = Payjp::Customer.create( # ここで先ほど生成したトークンを顧客情報と紐付け、PAYJP管理サイトに送信
        email: current_user.email,
        card: params['payjp-token'],
        metadata: {user_id: currentuser.id}
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to cards_path
      else
        render 'mypages/create_card'
      end
    end
  end

  # 後ほど削除機能を実装します。
  def destroy
  end

  private

  def set_card
    @card = Card.where(user_id: current_user.id).first if Card.where(user_id: current_user.id).present?
