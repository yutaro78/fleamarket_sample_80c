class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_parents, only: [:new, :create, :edit]

  def index
  end
  
  def new
    @item = Item.new
    @item.images.new
    # @category_parents = Category.where(ancestry: nil)
  end
  
  def create
    @item = Item.new(item_params)
    # binding.pry
    if @item.save
      redirect_to new_item_path
      # redirect_to root_path
    else
      render new_item_path
      # render :new
    end
  end
  
  def show
    @items = Item.includes(:images).order('created_at DESC')
  end

  def edit
    # @category_parents = Category.where(ancestry: nil)
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  def set_parents
    @category_parents = Category.where(ancestry: nil)
  end



  def search_category
    # binding.pry
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

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :condition, :size_id, :category_id, :brand, :prefecture_id, :shipping_cost_id, :shipping_days_id, images_attributes: [:url, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
