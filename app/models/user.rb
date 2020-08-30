class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /@/ }
  validates :password, presence: true, format: { with: /\A[a-z\d]{6,}\z/i }
  validates :first_name, presence: true, format: { with: /\A[あ-ん ア-ン 一-龥]+\z/ }
  validates :last_name, presence: true, format: { with: /\A[あ-ん ア-ン 一-龥]+\z/ }
  validates :first_name_kana, presence: true, format: { with: /\A[ア-ン]+\z/ }
  validates :last_name_kana, presence: true, format: { with: /\A[ア-ン]+\z/ }
  validates :date_of_birth, presence: true

end
