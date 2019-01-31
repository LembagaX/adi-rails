class CategoriesController < ApplicationController
  before_action :check_token
  before_action :check_warehouse
  before_action :set_category, only: [:show, :update, :destroy]

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
      @category = Category.friendly.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name)
    end
end
