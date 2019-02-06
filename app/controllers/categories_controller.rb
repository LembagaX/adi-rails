class CategoriesController < ApplicationController
  before_action :check_token
  before_action :set_category, only: [:show, :update, :destroy]
  before_action :can_manage

  def index
    @categories = Category.all
  end

  def show
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      render :show, status: :created, location: @category
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  def update
    if @category.update(category_params)
      render :show, status: :ok, location: @category
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @category.destroy
      render :show, status: :ok, location: @category
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  private
    def set_category
      @category = Category.find_by_slug params[:id]
      unless @category
        render json: {}, status: :unprocessable_entity
      end
    end

    def category_params
      params.require(:category).permit(:name)
    end

    def can_manage
      unless can? :manage, Category
        render json: { message: 'Unauthorized' }, status: :non_authoritative_information
      end
    end
end
