class CurrenciesController < ApplicationController
  before_action :check_token
  before_action :check_ability, except: [:index, :show]
  before_action :set_currency, only: [:show, :update, :destroy]

  def index
    @currencies = Currency.order created_at: :desc
  end

  def show
  end

  def create
    @currency = current_user.currencies.new(currency_params)

    if @currency.save
      render :show, status: :created, location: @currency
    else
      render json: @currency.errors, status: :unprocessable_entity
    end
  end

  def update
    if @currency.update(currency_params)
      render :show, status: :ok, location: @currency
    else
      render json: @currency.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @currency.destroy
      render :show, status: :ok, location: @currency
    else
      render json: @currency.errors, status: :unprocessable_entity
    end
  end

  private
    def set_currency
      @currency = Currency.find_by_code(params[:id])
    end

    def currency_params
      params.require(:currency).permit(:code)
    end

    def check_ability
      if cannot? :manage, Currency
        render json: { message: "Unauthorized"}, status: :unprocessable_entity
      end
      
    end
    
end
