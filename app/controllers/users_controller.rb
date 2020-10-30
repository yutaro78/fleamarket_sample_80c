class UsersController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def new
  end
  
  def create
    if current_user.create(user_params)
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
