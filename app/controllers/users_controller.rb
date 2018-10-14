class UsersController < ApplicationController
  before_action :set_user, only: [ :generate ]

  def generate
    if @user and @user.authenticate params[:user][:password]
      generate_token
    else
      render status: 203
    end
  end

  private

  def set_user
    require_user_params
    @user = User.find_by_email params[:user][:email]
  end

  def require_user_params
    params.require(:user).permit(:email, :password)
  end

  def generate_token
    @token = @user.generate_token params[:user][:password]
  end
end
