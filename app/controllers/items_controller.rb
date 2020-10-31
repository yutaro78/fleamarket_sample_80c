class ItemsController < ApplicationController

  def index
    @items = Item.includes(:images).order('created_at DESC')
  end

  def new
    @item = Item.new
    @item.images.new
    @category_parents = Category.where(ancestry: nil)
  end

  def create
    @item = Item.new(item_params)
    # binding.pry
    @item.save
    redirect_to new_item_path
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :condition, :size_id, :category_id, :brand, :prefecture_id, :shipping_cost_id, :shipping_days_id, images_attributes: [:url]).merge(user_id: current_user.id)
  end

end
