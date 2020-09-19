class ItemOrder

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :block_number, :building_name, :phone_number, :item_id, :user_id, :order_id

  with_options presence: true do
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message:  "is invalid. Include hyphen(-)" }
    validates :city
    validates :block_number
    validates :phone_number, format: { with: /\A[0-9]{11}\z/, message: "ハイフンを除いた11桁で入力してください" }
  end

  def save
    item = Item.find(item_id)
    order = Order.create(item_id: item_id, user_id: user_id)
    item.update(order_id: order.id)
    ShippingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, block_number: block_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end

end