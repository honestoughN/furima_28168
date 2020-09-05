class ItemsController < ApplicationController
  before_action :move_to_sign_in, only: [:new]
  
  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
    redirect_to root_path
  end

  private
  def move_to_sign_in
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def item_params
    params.require(:item).permit(:name, :image, :detail, :category_id, :status, :shipping_charge_id, :shipping_area_id, :shipping_day_id, :selling_price)
  end
end
