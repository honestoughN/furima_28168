class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :email, uniqueness: true, format: { with: /@/, message: "@を含めて入力して下さい" }
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+{6,}\z/i, message: "半角英数字6文字以上で入力して下さい" }
    validates :first_name, format: { with: /\A[あ-ん ア-ン 一-龥]+\z/, message: "全角(ひらがな、カタカナ、漢字)で入力して下さい" }
    validates :last_name, format: { with: /\A[あ-ん ア-ン 一-龥]+\z/, message: "全角(ひらがな、カタカナ、漢字)で入力して下さい" }
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "全角カタカナで入力して下さい" }
    validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "全角カタカナで入力して下さい" }
    validates :date_of_birth
  end
  has_many :items
  has_many :orders
end
