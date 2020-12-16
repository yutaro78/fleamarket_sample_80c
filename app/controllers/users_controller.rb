class UsersController < ApplicationController

  def show
    @category_parents = Category.where(ancestry: nil)
  end

end
