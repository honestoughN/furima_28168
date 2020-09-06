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

    context '出品登録がうまくいかないとき' do
      it 'imageが空だと出品できない' do
      end
      it 'nameが空だと出品できない' do
        
      end
      it 'detailが空だと出品できない' do
        
      end
      it 'categoryが空だと出品できない' do
        
      end
      it 'categoryが---だと出品できない' do
        
      end
      it 'statusが空だと出品できない' do
        
      end
      it 'statusが---だと出品できない' do
        
      end
      it 'shipping_chargeが空だと出品できない' do
        
      end
      it 'shipping_chargeが---だと出品できない' do
        
      end
      it 'shippin_areaが空だと出品できない' do
        
      end
      it 'shipping_areaが---だと出品できない' do
        
      end
      it 'shipping_dayが空だと出品できない' do
        
      end
      it 'shipping_dayが---だと出品できない' do
        
      end
      it 'selling_priceが空だと出品できない' do
        
      end
      it 'selling_priceが299以下だと出品できない' do
        
      end
      it 'selling_priceが10000000以上だと出品できない' do
        
      end
    end
    end
  end
end
