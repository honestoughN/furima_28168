require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nickname、email、passwordとpassword_confirmation、first_name、last_name、first_name_kana、last_name_kana、date_of_birthが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが半角英数字6文字以上で登録できる" do
        @user.password = "abc000"
        @user.password_confirmation = "abc000"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it "重複したemailが存在する場合は登録できない" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it "emailに@がないと登録できない" do
        @user.email = "abc123.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは@を含めて入力して下さい")
      end
      it "passwordが空だと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it "passwordが5文字以下だと登録できない" do
        @user.password = "abc00"
        @user.password_confirmation = "abc00"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it "passwordは半角英数字混合でないと登録できない" do
        @user.password = "aaaaaa"
        @user.password_confirmation = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは半角英数字6文字以上で入力して下さい")
      end
      it "passwordが存在してもpassword_confirmationが空だと登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it "first_nameが空だと登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字を入力してください")
      end
      it "first_nameが半角だと登録できない" do
        @user.first_name = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字は全角(ひらがな、カタカナ、漢字)で入力して下さい")
      end
      it "last_nameが空だと登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end
      it "last_nameが半角だと登録できない" do
        @user.last_name = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("名前は全角(ひらがな、カタカナ、漢字)で入力して下さい")
      end
      it "first_name_kanaが空だと登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字（カナ）を入力してください")
      end
      it "first_name_kanaが漢字・ひらがなだと登録できない" do
        @user.first_name_kana = "太郎たろう"
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字（カナ）は全角カタカナで入力して下さい")
      end
      it "last_name_kanaが空だと登録できない" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("名前（カナ）を入力してください")
      end
      it "last_name_kanaが漢字・ひらがなだと登録できない" do
        @user.last_name_kana = "太郎たろう"
        @user.valid?
        expect(@user.errors.full_messages).to include("名前（カナ）は全角カタカナで入力して下さい")
      end
      it "date_of_birthが空だと登録できない" do
        @user.date_of_birth = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end
    end
  end
end
