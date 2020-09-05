class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_day
  has_one_attached :image

  validates :name, :image, :detail, :category_id,
            :status_id, :shipping_charge_id, :shipping_area_id,
            :shipping_day_id, :selling_price, presence: true

  validates :category_id, :status_id, :shipping_charge_id,
            :shipping_area_id, :shipping_day_id, numericality: { other_than: 1 }
end
