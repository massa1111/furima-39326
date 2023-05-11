require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end


  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it "nickname、last_name、first_name、last_name_kana、first_name_kana、birth_dateとemail、passwordとpassword_confirmationが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it "nicknameが空では登録できない" do

      end
      it "last_nameが空では登録できない" do

      end
      it "first_nameが空では登録できない" do

      end
      it "last_name_kanaが空では登録できない" do

      end
      it "first_name_kanaが空では登録できない" do

      end
      it "last_name_kanaが空では登録できない" do

      end
      it "first_name_kanaが空では登録できない" do

      end
      it "birth_dateが空では登録できない" do

      end
      it "emailが空では登録できない" do

      end
      it "passwordが空では登録できない" do

      end
      it "password_confirmationが空では登録できない" do

      end
     
      
      
      it 'passwordが5文字以下では登録できない' do

      end
      it 'passwordが129文字以上では登録できない' do

      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do

      end
      it '重複したemailが存在する場合は登録できない' do

      end
      it 'emailは@を含まないと登録できない' do

      end
    end
  end
end