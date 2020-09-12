class ShippingAddress < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :order

  with_options presence: true do
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :postal_code
    validates :city
    validates :block_number
    validates :phone_number
  end
end
