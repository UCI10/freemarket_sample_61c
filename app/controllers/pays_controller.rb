class PaysController < ApplicationController

  require 'payjp'

  def new
    pay = current_user.credit_card
    if pay.blank?
      redirect_to controller: 'products', action: "show" 
    else
      Payjp.api_key = "sk_test_0e2eb234eabf724bfaa4e676"
      customer = Payjp::Customer.retrieve(card.customer_id)
      @customer_card = customer.cards.retrieve(card.card_id)
    end
    
  end

  def pay
    Payjp.api_key = 'sk_test_0ddb364bab7ed621b29956cb'
    charge = Payjp::Charge.create(
    :amount => @product.price,
    :card => params['payjp-token'],
    :currency => 'jpy',
  )
  end

  def buy #クレジット購入

    if pay.blank?
      redirect_to action: "new"
      flash[:alert] = '購入にはクレジットカード登録が必要です'
    else
      @product = Product.find(params[:product_id])
     # 購入した際の情報を元に引っ張ってくる
      pay = current_user.credit_card
     # テーブル紐付けてるのでログインユーザーのクレジットカードを引っ張ってくる
      Payjp.api_key = "sk_test_a0947663b395402fc1e150b4"
     # キーをセットする(環境変数においても良い)
      Payjp::Charge.create(
      amount: @product.price, #支払金額
      customer: pay.customer_id, #顧客ID
      currency: 'jpy', #日本円
      )
     # ↑商品の金額をamountへ、cardの顧客idをcustomerへ、currencyをjpyへ入れる
      if @product.update(status: 1, buyer_id: current_user.id)
        flash[:notice] = '購入しました。'
        redirect_to controller: "products", action: 'show'
      else
        flash[:alert] = '購入に失敗しました。'
        redirect_to controller: "products", action: 'show'
      end
     #↑この辺はこちら側のテーブル設計どうりに色々しています
    end
  end

  def delete
    pay = current_user.credit_card
    if pay.blank?
      redirect_to action: "new"
    else
      Payjp.api_key = 'sk_test_0e2eb234eabf724bfaa4e676'
      customer = Payjp::Customer.retrieve(pay.customer_id)
      customer.delete
     #ここでpay.jpの方を消している
      card.delete
     #ここでテーブルにあるcardデータを消している
    end  
end

end
