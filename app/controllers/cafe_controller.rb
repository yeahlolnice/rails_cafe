class CafeController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :set_menu #only: [:order]

    def index
    end

    def order
        menu_row = @menu.find_by_item(params[:id])
        render json: menu_row[:price]
    end

    def set_menu
        @menu = MenuItem.all
    end
end
