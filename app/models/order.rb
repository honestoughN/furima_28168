class Order < ApplicationRecord
  attr_accessor :token
  belongs_to :item
  belongs_to :user
  has_one :shipping_address

  validates :token, presence: true
end
