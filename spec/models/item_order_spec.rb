require 'rails_helper'
RSpec.describe ItemOrder, type: :model do
  before do
    @item_order = FactoryBot.build(:item_order)
  end

  describe '商品の購入' do
    context '購入がうまくいくとき' do
      it 'すべての値が正しく入力されていれば購入できる' do
        expect(@item_order).to be_valid
      end
      it '建物名の記述がなくても購入できる' do
        @item_order.building_name = ""
        expect(@item_order).to be_valid
      end
    end

    context '購入がうまくいかないとき' do
      it 'カード情報が空だと購入できない' do
        @item_order.token = ""
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("カード情報を入力してください")
      end
      it '郵便番号が空だと購入できない' do
        @item_order.postal_code = ""
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("郵便番号を入力してください")
      end
      it '郵便番号にハイフンが書かれていないと購入できない' do
        @item_order.postal_code = "1234567"
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("郵便番号はハイフンを入れた半角数字7桁で入力してください")
      end
      it '郵便番号が全角で書かれていると購入できない' do
        @item_order.postal_code = "１２３-４５６７"
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("郵便番号はハイフンを入れた半角数字7桁で入力してください")
      end
      it '郵便番号が7桁を超えると購入できない' do
        @item_order.postal_code = "1234-5678"
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("郵便番号はハイフンを入れた半角数字7桁で入力してください")
      end
      it '都道府県の選択をしないままだと購入できない' do
        @item_order.prefecture_id = "1"
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("都道府県を選択してください")
      end
      it '市区町村が空だと購入できない' do
        @item_order.city = ""
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("市区町村を入力してください")
      end
      it '番地が空だと購入できない' do
        @item_order.block_number = ""
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("番地を入力してください")
      end
      it '電話番号が空だと購入できない' do
        @item_order.phone_number = ""
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("電話番号を入力してください")
      end
      it '電話番号にハイフンが入っていると購入できない' do
        @item_order.phone_number = "090-1234-5678"
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("電話番号はハイフンを除いた半角数字11桁で入力してください")
      end
      it '電話番号が11桁よりも多い時ときは購入できない' do
        @item_order.phone_number = "090123456789"
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("電話番号はハイフンを除いた半角数字11桁で入力してください")
      end
    end
  end
end
