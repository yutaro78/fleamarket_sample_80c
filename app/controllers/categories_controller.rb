class CategoriesController < ApplicationController
  before_action :set_parents, only: [:new, :create, :edit, :index]

  def show
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

  private

  def set_parents
    @category_parents = Category.where(ancestry: nil)
  end
end
