class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update,:destroy]
  before_action :set_parents, only: [:new, :create, :edit, :index]
  before_action :set_category, only: [:index]
  before_action :item_current_user, only: [:edit, :update, :destroy]

  def index
    @items = Item.order("id DESC").last(5)
    @ladies = @ladies.set_items.order("id DESC").last(5)
    @mens = @mens.set_items.order("id DESC").last(5)
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
      render :new
    end
  end
  
  def show
    @items = Item.includes(:images).order('created_at DESC')
    @items = Item.order(created_at: :desc).limit(5)
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
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
    @item = Item.find(params[:id])
  end

  def item_current_user
    unless @item.user_id == current_user.id
      redirect_to root_path
    end
  end
  
end
