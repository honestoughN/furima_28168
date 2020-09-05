class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_day
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :image
    validates :detail
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :status_id
      validates :shipping_charge_id
      validates :shipping_area_id
      validates :shipping_day_id
    end
    validates :selling_price, numericality: { only_integer: true }
  end
end
