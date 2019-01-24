class ChartsController < ApplicationController
    before_action :check_token

    def user_by_role
        @roles = Role.order :name
    end

    def purchasing_growth
      @start  = Purchase.where(created_at: 1.month.ago.beginning_of_month...1.month.ago.at_end_of_month).count.to_f
      @stop   = Purchase.where(created_at: Time.current.beginning_of_month...Time.current.at_end_of_month).count.to_f
        if @start != 0
            @growth = ((@stop - @start) / @start) * 100
        end
    end
end
