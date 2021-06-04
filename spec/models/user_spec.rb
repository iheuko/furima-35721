require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end
    describe 'ユーザー新規登録' do
      context '保存できる場合' do
        it '正しく入力すれば登録できること' do
          expect(@user).to be_valid
        end

        it 'passwordが6文字以上であれば登録できること' do
          @user.password = '1234Aa'
          @user.password_confirmation = '1234Aa'
          expect(@user).to be_valid
        end
      end
    

      context '保存できない場合' do
        it 'nicknameが空では登録できないこと' do
          @user.nickname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end

        it 'emailが空では登録できないこと' do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end

        it 'emailに＠がないと登録できないこと' do
          @user.email = 'testgmail.com'
          @user.valid?
          expect(@user.errors.full_messages).to include("Email is invalid")
        end

        it 'passwordが空では登録できないこと' do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end

        it 'password_confirmationが空では登録できないこと' do
          @user.password_confirmation = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation is invalid")
        end

        it 'passwordが英字のみでは登録できないこと' do
          @user.password = 'aaaaaa'
          @user.password_confirmation = 'aaaaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid")
        end

        
        it 'passwordが数字のみでは登録できないこと' do
          @user.password = '123456'
          @user.password_confirmation = '123456'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid")
        end

        it 'passwordが全角では登録できないこと' do
          @user.password = '１あｂ1ab'
          @user.password_confirmation = '１あｂ1ab'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid")
        end

        it 'birthdayが空では登録できないこと' do
          @user.birthday = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Birthday can't be blank")
        end

        it 'last_nameが空では登録できないこと' do
          @user.last_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name can't be blank")
        end

        it 'first_nameが空では登録できないこと' do
          @user.first_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank")
        end

        it 'last_name_katakanaが空では登録できないこと' do
          @user.last_name_katakana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name katakana can't be blank")
        end

        it 'first_name_katakanaが空では登録できないこと' do
          @user.first_name_katakana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name katakana can't be blank")
        end

        it 'passwordが5文字以下であれば登録できないこと' do
          @user.password = '1234a'
          @user.password_confirmation = '1234a'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
        end

        it 'passwordとpassword_confirmationが不一致では登録できないこと' do
          @user.password = '12345a'
          @user.password_confirmation = '12345b'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

        it '重複したemailが存在する場合登録できないこと' do
          @user.save
          another_user = FactoryBot.build(:user, email: @user.email)
          another_user.valid?
          expect(another_user.errors.full_messages).to include('Email has already been taken')
        end

        it 'last_nameはアルファベットでは登録できないこと' do
          @user.last_name = 'aaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name is invalid")
        end
        
        it 'first_nameはアルファベットでは登録できないこと' do
          @user.first_name = 'bbbb'
          @user.valid?
          expect(@user.errors.full_messages).to include("First name is invalid")
        end

        it 'last_name_katakanaは平仮名では登録できないこと' do
          @user.last_name_katakana = 'あああ'
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name katakana is invalid")
        end

        it 'first_name_katakanaはアルファベットでは登録できないこと' do
          @user.first_name_katakana = 'aaa'
          @user.valid?
          expect(@user.errors.full_messages).to include("First name katakana is invalid")
        end

        it 'last_name_katakanaはアルファベットでは登録できないこと' do
          @user.last_name_katakana = 'bbb'
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name katakana is invalid")
        end

        it 'first_name_katakanaは平仮名では登録できないこと' do
          @user.first_name_katakana = 'いいい'
          @user.valid?
          expect(@user.errors.full_messages).to include("First name katakana is invalid")
        end
      end
    end 
  end
end
