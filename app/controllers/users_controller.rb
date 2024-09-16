class UsersController < ApplicationController
  def new
    redirect_to root
  end

  def edit
  end

  def update
  end

  private

  def user_params
     params.require(:user).permit(:nickname, :email, :password, :last_name, :first_name, :last_name_kana, :first_name_kana, :date_of_birth)
  end
end
