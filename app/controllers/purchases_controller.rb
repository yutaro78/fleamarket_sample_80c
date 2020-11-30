class PurchasesController < ApplicationController
  require 'payjp'#Payjpの読み込み
  before_action :set_card, :set_item
  def index
    @user = current_user
    @card = Pay.where(user_id: current_user.id).first
    @address = Address.where(user_id: current_user.id).first
    @item = Item.find(params[:item_id])
  #Payjpの秘密鍵を取得
    Payjp.api_key = 'sk_test_af3434547c7810594fce6067'
  #Payjpから顧客情報を取得し、表示
    customer = Payjp::Customer.retrieve(@card.customer_id)
    @card_information = customer.cards.retrieve(@card.card_id)
  end
  def create
    #クレジットカードと製品の変数を設定
        @item = Item.find(params[:item_id])
        @card =Pay.where(user_id: current_user.id).first
        # @item = Item.find(params[:id])
     #Payjpの秘密鍵を取得
        Payjp.api_key= 'sk_test_af3434547c7810594fce6067'
     #payjp経由で支払いを実行
        charge = Payjp::Charge.create(
          amount: @item.price,
          customer: Payjp::Customer.retrieve(@card.customer_id),
          currency: 'jpy'
        )
         @product_buyer= Item.find(params[:item_id])
         Order.create(user_id: current_user.id, item_id: @product_buyer.id)
         redirect_to item_purchase_path(@item.id,@item.id)
  end
  def show
    @item = Item.find(params[:item_id])
    @product_buyer= Item.find(params[:id])
    @product_buyer.update( user_id: current_user.id)
    
  end
  private
 
  # def item_params
  #   params.require(:item).permit(
  #     :name,
  #     :text,
  #     :price,
  #     #この辺の他コードは関係ない部分なので省略してます
  #   ).merge(user_id: current_user.id)
  # end

  
end
