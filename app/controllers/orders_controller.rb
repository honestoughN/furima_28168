class OrdersController < ApplicationController
  before_action :move_to_sign_in
  before_action :set_item, only: [:new, :create]
  before_action :move_to_index
 
  def new
    @order = ItemOrder.new
  end
  
  def create
    @order = ItemOrder.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'new'
    end
  end

  private
  def move_to_index
    unless current_user.id != @item.user.id || @item.order.blank?
      redirect_to root_path
    end
  end

  def move_to_sign_in
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
  
  def order_params
    params.require(:item_order).permit(:postal_code, :prefecture_id, :city, :block_number, :building_name, :phone_number).merge(item_id: @item[:id], user_id: current_user.id, token: params[:token])
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.selling_price,
      card: params[:token],
      currency:'jpy'
    )
  end
end

