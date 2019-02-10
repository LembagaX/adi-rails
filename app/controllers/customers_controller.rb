class CustomersController < ApplicationController
  before_action :check_token
  before_action :check_ability, except: [:index, :show]
  before_action :set_customer, only: [:show, :update, :destroy]

  def index
    @customers = Customer.order name: :asc
  end

  def show
  end

  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      render :show, status: :created, location: @customer
    else
      render json: @customer.errors, status: :unprocessable_entity
    end
  end

  def update
    if @customer.update(customer_params)
      render :show, status: :ok, location: @customer
    else
      render json: @customer.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @customer.destroy
      render :show, status: :ok, location: @customer
    else
      render json: @customer.errors, status: :unprocessable_entity
    end
  end

  private
    def set_customer
      @customer = Customer.find(params[:id])
    end

    def customer_params
      params.require(:customer).permit(:name, :phone)
    end

    def check_ability
      if cannot? :manage, Customer
        render json: { code: 'Unauthorized' }, status: :unprocessable_entity
      end
    end
    
end
