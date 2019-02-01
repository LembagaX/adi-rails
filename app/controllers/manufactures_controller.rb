class ManufacturesController < ApplicationController
  before_action :check_token
  before_action :check_warehouse
  before_action :set_manufacture, only: [:show, :update, :destroy]
  before_action :check_unused_manufacture, only: [:create]

  def index
    @manufactures = Manufacture.all
  end

  def show
  end

  def create
    @manufacture = Manufacture.new(user: current_user)

    if @manufacture.save
      render :show, status: :created, location: @manufacture
    else
      render json: @manufacture.errors, status: :unprocessable_entity
    end
  end

  def update
    if @manufacture.update(user: current_user)
      render :show, status: :ok, location: @manufacture
    else
      render json: @manufacture.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @manufacture.destroy
      render :show, status: :ok, location: @manufacture
    else
      render json: @manufacture.errors, status: :unprocessable_entity
    end
  end

  def check_unused_manufacture
    unless Manufacture.last.nil?
      if Manufacture.last.products.count == 0
        @manufacture = Manufacture.last
        @manufacture.update user: current_user
        render :show, status: :ok, location: @manufacture
      end
    end
  end

  private
    def set_manufacture
      @manufacture = Manufacture.find_by_code(params[:id])
    end
end
