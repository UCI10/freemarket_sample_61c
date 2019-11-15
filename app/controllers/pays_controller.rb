class PaysController < ApplicationController

  require 'payjp'

  def pay
    Payjp.api_key = 'sk_test_0ddb364bab7ed621b29956cb'
    charge = Payjp::Charge.create(
    :amount => @product.price,
    :card => params['payjp-token'],
    :currency => 'jpy',
  )
  end

  # def index
  #   card = Card.where(user_id: current_user.id).first
  #   #Cardテーブルは前回記事で作成、テーブルからpayjpの顧客IDを検索
  #   if card.blank?
  #     #cardテーブルは前回記事で作成、テーブルからpay.jpの顧客IDを検索
  #   if card.blank?
  #     #登録された情報がない場合にカード登録画面に移動
  #     redirect_to controller: "card", action: "new"
  #   else
  #     payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
  #     #保管した顧客IDでpay.jpから情報取得
  #     customer = Payjp::Customer.retrieve(card.customer_id)
  #     #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
  #     @default_card_information = customer.cards.retrieve(card.card_id)
  #   end
  #   end

    def pay
      card = Card.where(user_id: current_user.id).first
      Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
      Payjp::Charge.create(
      :amount => 13500, #支払金額を入力（itemテーブル等に紐づけても良い）
      :customer => card.customer_id, #顧客ID
      :currency => 'jpy', #日本円
    )
    redirect_to action: 'done' #完了画面に移動
    end

    


end
