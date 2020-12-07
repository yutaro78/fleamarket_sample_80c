class PurchasesController < ApplicationController
  require "payjp"
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :set_creditcard, only: [:index]
  
  def index
    redirect_to root_path if @item.order.present?
    redirect_to root_path if current_user.id == @item.user_id
    @user = current_user
    @card = Pay.where(user_id: current_user.id).first
  #Payjpの秘密鍵を取得
    if @card.blank?
    #登録された情報がない場合にカード登録画面に移動
    
    else
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  #Payjpから顧客情報を取得し、表示
    customer = Payjp::Customer.retrieve(@card.customer_id)
    @default_card_information = customer.cards.retrieve(@card.card_id)
    
    end
  end
  def create
    #クレジットカードと製品の変数を設定
        @card =Pay.where(user_id: current_user.id).first
        # @item = Item.find(params[:id])
     #Payjpの秘密鍵を取得
        Payjp.api_key= ENV["PAYJP_SECRET_KEY"]
     #payjp経由で支払いを実行
        charge = Payjp::Charge.create(
          amount: @item.price,
          customer: Payjp::Customer.retrieve(@card.customer_id),
          currency: 'jpy'
        )
         @product_buyer= Item.find(params[:item_id])
         Order.create(user_id: current_user.id, item_id: @product_buyer.id)
        #  redirect_to item_purchase_path(@item.id,@item.id)
         
  end
  
  private
  def set_creditcard
    @card = Pay.where(user_id: current_user.id).first if Pay.where(user_id: current_user.id).present?
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end
