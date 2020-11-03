class CafeController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :set_menu #only: [:order]

    def index
    end

    def order
        menu_row = @menu.find_by_item(params[:id])
        redirect_to menu_item_path(menu_row)
    end

    def set_menu
        @menu = MenuItem.all
    end
end
