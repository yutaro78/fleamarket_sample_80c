class CategoriesController < ApplicationController
  before_action :set_parents, only: [:index, :show]
  before_action :set_category, only: [:show]

  def index
  end

  def show
    @items = @category.set_items
  end

  def search_category
    respond_to do |format|
      format.html
      format.json do
        if params[:parent_id]
          @childrens = Category.find(params[:parent_id]).children
        elsif params[:children_id]
          @grandchildrens = Category.find(params[:children_id]).children
        elsif params[:grandchildren_id]
          @category_parents = Category.where(id: params[:grandchildren_id])
        end
      end
    end
  end

  def set_parents
    @category_parents = Category.where(ancestry: nil)
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

end
