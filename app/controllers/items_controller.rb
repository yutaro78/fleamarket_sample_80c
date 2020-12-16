class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update,:destroy]
  before_action :set_parents, only: [:new, :create, :edit, :index, :show]
  before_action :set_category, only: [:index, :show]
  before_action :item_current_user, only: [:edit, :update, :destroy]

  def index
    @items = Item.order("id DESC").limit(5)
    @ladies = @ladies.set_items.order("id DESC").limit(5)
    @mens = @mens.set_items.order("id DESC").limit(5)
  end
  
  def new
    @item = Item.new
    @item.images.new
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      @item.images.new
      render :new
    end
 
  end
  
  def show
    @items = Item.includes(:images).order('created_at DESC')
   
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
    @items = Item.order("id DESC").limit(5)
  end

  def edit
    redirect_to root_path if @item.order.present?
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      redirect_to edit_item_path(@item), alert: @item.errors.full_messages
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def set_parents
    @category_parents = Category.where(ancestry: nil)
  end
 


  def search_category
    respond_to do |format|
      format.html
      format.json do
        if params[:parent_id]
          @childrens = Category.find(params[:parent_id]).children
        elsif params[:children_id]
          @grandchildrens = Category.find(params[:children_id]).children
        end
      end
    end
  end

  private
  def set_category
    @ladies = Category.find(1)
    @mens = Category.find(200)
  end

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :condition_id, :size_id, :category_id, :brand, :prefecture_id, :shipping_cost_id, :shipping_days_id, images_attributes: [:url, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def set_item
    if Item.where(id: params[:id]).present?
      @item = Item.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def item_current_user
    unless @item.user_id == current_user.id
      redirect_to root_path
    end
  end
  
end
