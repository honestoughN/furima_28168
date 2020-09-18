class ItemOrder

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :block_number, :building_name, :phone_number, :item_id, :user_id, :order_id

  def save
    item = Item.find(item_id)
    order = Order.create(item_id: item_id, user_id: user_id)
    item.update(order_id: order.id)
    ShippingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, block_number: block_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end

end