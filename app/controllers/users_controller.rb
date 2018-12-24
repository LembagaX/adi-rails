class UsersController < ApplicationController
  before_action :set_user, only: [:token]
  before_action :set_user_from_token, only: [:create, :check]
  before_action :check_token, only: [:index, :show, :update, :destroy]
  before_action :set_user_by_id, only: [:show, :update, :destroy]

  def index
    @users = User.order created_at: :asc
  end

  def show
  end

  def create
    if User.valid_token? params[:token] and @current_user.active_token? params[:token]
      @user = User.new(user_params)
      if can? :manage, User
        if @user.save
          # TODO : send email to user
          render :show, status: :ok, location: @user
        else
          render json: { message: @user.errors, code: :unprocessable_entity }, status: :unprocessable_entity
        end
      else
        render :show, status: :non_authoritative_information
      end
    else
      render :show, status: :non_authoritative_information
    end
  end

  def update
    if @user.update user_params
      render :show, status: :ok
    else
      render json: { code: :unprocessable_entity }, status: :unprocessable_entity
    end
  end

  def destroy
    if can? :manage, User
      if @user.destroy
        render json: { code: 200 }, status: :ok
      end
    end
  end

  def token
    if @user and @user.authenticate params[:user][:password]
      generate_token
    else
      render status: :non_authoritative_information
    end
  end

  def check
    if @user.active_token? params[:token]
      render json: { code: 200 }, status: :ok
    else
      render json: { code: 203 }, status: :non_authoritative_information
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :role_id)
    end


    def set_user
      require_user_params
      @user = User.find_by_email params[:user][:email]
    end

    def set_user_by_id
      @user = User.find params[:id]
    end

    def require_user_params
      params.require(:user).permit(:email, :password)
    end

    def generate_token
      @token = @user.generate_token params[:user][:password]
    end

    def set_user_from_token
      @current_user = User.find_by_token params[:token]
    end
end
