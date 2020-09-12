class OrdersController < ApplicationController
  before_action :move_to_sign_in

  def show
    @item = Item.find(params[:id])
  end
  def create
    # Order.create(order_params)
  end
  private
  def move_to_sign_in
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def order_params
    params.require(:order).merge(item_id: params[:item_id], user_id: params[:user_id])
  end
end
