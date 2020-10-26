class MenuItemsController < ApplicationController
  before_action :set_menu_item, only: [:show, :update, :edit, :destroy]
  def index
    @items = MenuItem.all.order(:item)
    
  end

  def show
  end

  def create
    item = MenuItem.create(menu_item_params)
    redirect_to menu_item_path(item)
  end

  def new
    @item = MenuItem.new
    @item.price = 0.50
    @item.quantity = 1
  end

  def update
    @item.update(menu_item_params)
    redirect_to menu_item_path(@item)
  end

  def edit
  end

  def destroy
    @item.destroy
    redirect_to menu_items_path()
  end

  private

  def menu_item_params
    # params.require(:item, :price, :quantity) this is for a form helper 
    params.require(:menu_item).permit(:item, :price, :quantity)
  end 

  def set_menu_item
    @item = MenuItem.find(params[:id])
  end
end
