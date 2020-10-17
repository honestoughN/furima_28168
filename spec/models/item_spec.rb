require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.png')
  end

  describe '出品登録' do
    context '出品登録がうまくいくとき' do
      it "image, name, detail, category, status, shipping_charge, shipping_area, shipping_day, selling_priceがあれば登録出品できる" do
        expect(@item).to be_valid
      end
    end
    context '出品登録がうまくいかないとき' do
      it 'imageが空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像をアップロードしてください")
      end
      it 'nameが空だと出品できない' do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it 'detailが空だと出品できない' do
        @item.detail = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end
      it 'categoryが空だと出品できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを選択してください")
      end
      it 'categoryが---だと出品できない' do
        @item.category_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを選択してください")
      end
      it 'statusが空だと出品できない' do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を選択してください")
      end
      it 'statusが---だと出品できない' do
        @item.status_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を選択してください")
      end
      it 'shipping_chargeが空だと出品できない' do
        @item.shipping_charge_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を選択してください")
      end
      it 'shipping_chargeが---だと出品できない' do
        @item.shipping_charge_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を選択してください")
      end
      it 'shippin_areaが空だと出品できない' do
        @item.shipping_area_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を選択してください")
      end
      it 'shipping_areaが---だと出品できない' do
        @item.shipping_area_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を選択してください")
      end
      it 'shipping_dayが空だと出品できない' do
        @item.shipping_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を選択してください")
      end
      it 'shipping_dayが---だと出品できない' do
        @item.shipping_day_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を選択してください")
      end
      it 'selling_priceが空だと出品できない' do
        @item.selling_price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格を入力してください")
      end
      it 'selling_priceが299以下だと出品できない' do
        @item.selling_price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は300以上の値にしてください")
      end
      it 'selling_priceが10000000以上だと出品できない' do
        @item.selling_price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は9999999以下の値にしてください")
      end
      it 'selling_priceが全角数字だと出品できない' do
        @item.selling_price = "４００"
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は数値で入力してください")
      end
    end
  end
end
