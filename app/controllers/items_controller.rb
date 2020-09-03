class ItemsController < ApplicationController
  before_action :move_to_sign_in, only: [:new]
  
  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  private
  def move_to_sign_in
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
end
