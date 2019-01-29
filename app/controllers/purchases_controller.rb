class PurchasesController < ApplicationController
    before_action :check_token
    before_action :check_warehouse
    before_action :set_material

    def index
        @purchases = @material.purchases
    end
    
    
    def create
        @provider = Provider.friendly.find_or_create_by provider_param
        @purchase = @provider.purchases.create purchase_param.merge(user_id: current_user.id)
        build_materials
        if @provider and @purchase
          @code = 200
        end
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
            material_exist = Material.friendly.find_by_slug single[:name].parameterize
            if material_exist
                material_exist.restock single[:quantity]
                material_exist.log_price single[:price], @provider.id
                unless material_exist.providers.friendly.find_by_slug @provider.slug
                    @provider.materials << material_exist
                    material_exist.material_purchases.create purchase_id: @purchase.id, price: single[:price], quantity: single[:quantity]
                end
            else
                new_material = Material.create name: single[:name], stock: single[:quantity]
                new_material.log_price single[:price], @provider.id
                @provider.materials << new_material
                new_material.material_purchases.create purchase_id: @purchase.id, price: single[:price], quantity: single[:quantity]
            end
        end
    end

    def set_material
        @material = Material.find params[:material_id]
    end
    
end