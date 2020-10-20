class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_day
  has_one_attached :image
  has_one :order
  has_many :comments

  with_options presence: true do
    validates :name
    validates :image, presence: { message: "をアップロードしてください" }
    validates :detail
    with_options numericality: { other_than: 1, message: "を選択してください" } do
      validates :category_id
      validates :status_id
      validates :shipping_charge_id
      validates :shipping_area_id
      validates :shipping_day_id
    end
    validates :selling_price,
              numericality: {
                only_integer: true,
                greater_than_or_equal_to: 300,
                less_than_or_equal_to: 9999999,
              }
  end
end
