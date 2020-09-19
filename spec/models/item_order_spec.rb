require 'rails_helper'
RSpec.describe ItemOrder, type: :model do
  # before do
  #   @item_order = FactoryBot.build(:item_order)
  # end

  describe '商品の購入' do
    context '購入がうまくいくとき' do
      it 'すべての値が正しく入力されていれば購入できる' do
        
      end
      it '建物名の記述がなくても購入できる' do
        
      end
    end

    context '購入がうまくいかないとき' do
      it 'カード番号が空だと購入できない' do
        
      end
      it 'カードの有効期限（月）が空だと購入できない' do
        
      end
      it 'カードの有効期限（年）が空だと購入できない' do
        
      end
      it 'カードのセキュリティコードが空だと購入できない' do
        
      end
      it '郵便番号が空だと購入できない' do
        
      end
      it '都道府県が空だと購入できない' do
        
      end
      it '市区町村が空だと購入できない' do
        
      end
      it '番地が空だと購入できない' do
        
      end
      it '電話番号が空だと購入できない' do
        
      end
    end
  end
end
