class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy, :generate]

  def create
    if User.valid_token? params[:token]
      @user = User.new(user_params)
      if @user.save
        # send email to user
        render :show, status: :ok, location: @user
      else
        render json: { message: @user.errors, code: 422 }, status: :unprocessable_entity
      end
    else
      render :show, status: 203
    end
  end

  def generate
    if @user and @user.authenticate params[:user][:password]
      generate_token
    else
      render status: 203
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end


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

  #def index
    #@users = User.all
  #end

  #def show
  #end

  #def update
    #if @user.update(user_params)
      #render :show, status: :ok, location: @user
    #else
      #render json: @user.errors, status: :unprocessable_entity
    #end
  #end

  #def destroy
    #@user.destroy
  #end

end
