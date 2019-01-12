class ChartsController < ApplicationController
    before_action :check_token
    
    def user_by_role
        @roles = Role.order :name
    end
end
