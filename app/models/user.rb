class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /@/, message: "@を含めて入力して下さい" }
  validates :password, presence: true, format: { with: /\A[a-z\d]{6,}\z/i, message: "半角英数字6文字以上で入力して下さい" }
  validates :first_name, presence: true, format: { with: /\A[あ-ん ア-ン 一-龥]+\z/, message: "全角(ひらがな、カタカナ、漢字)で入力して下さい" }
  validates :last_name, presence: true, format: { with: /\A[あ-ん ア-ン 一-龥]+\z/, message: "全角(ひらがな、カタカナ、漢字)で入力して下さい" }
  validates :first_name_kana, presence: true, format: { with: /\A[ア-ン]+\z/, message: "全角カタカナで入力して下さい" }
  validates :last_name_kana, presence: true, format: { with: /\A[ア-ン]+\z/, message: "全角カタカナで入力して下さい" }
  validates :date_of_birth, presence: true

end
