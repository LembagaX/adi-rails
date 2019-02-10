class AddressesController < ApplicationController
  before_action :check_token
  before_action :check_ability
  before_action :set_customer, except: [:index]
  before_action :set_address, only: [:show, :update, :destroy]

  def index
    @addresses = Address.order created_at: :desc
  end

  def show
  end

  def create
    @address = @customer.addresses.new(address_params)

    if @address.save
      render :show, status: :created, location: customer_addresses_url(@customer)
    else
      render json: @address.errors, status: :unprocessable_entity
    end
  end

  def update
    if @address.update(address_params)
      render :show, status: :ok, location: customer_addresses_url(@customer)
    else
      render json: @address.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @address.destroy
      render :show, status: :ok, location: customer_addresses_url(@customer)
    end
  end

  private
    def set_customer
      @customer = Customer.find params[:customer_id]
    end
    
    def set_address
      @address = @customer.addresses.find(params[:id])
    end

    def address_params
      params.require(:address).permit(:address)
    end

    def check_ability
      if cannot? :manage, Customer
        render json: { message: 'Unauthorized' }, status: :unprocessable_entity
      end
    end
end
