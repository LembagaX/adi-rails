class PurchasesController < ApplicationController
    before_action :check_token

    def create
        @provider = Provider.friendly.find_or_create_by provider_param
        @purchase = @provider.purchases.create purchase_param.merge(user_id: current_user.id)
        build_materials
    end

    private

    def provider_param
        params.require(:provider).permit(:name)
    end

    def purchase_param
        params.require(:purchase).permit(:invoice, :amount, :note, :purchased_at)
    end

    def build_materials
        params.require(:materials).map do |material|
            single = material.permit(:name, :quantity, :price)
            if @provider.materials.friendly.find_by_slug single[:name].parameterize
                @provider.materials.friendly.find(single[:name].parameterize).restock single[:quantity]
                @provider.materials.friendly.find(single[:name].parameterize).log_price single[:price], @provider.id
            else
                @provider.materials.create name: single[:name], stock: single[:quantity]
                @provider.materials.friendly.find(single[:name].parameterize).log_price single[:price], @provider.id
            end
        end
    end
end