require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    describe 'ユーザー新規登録' do
      context '新規登録がうまくいく時' do
        it '全ての項目を記入していれば登録できる' do
          expect(@user).to be_valid
        end
        it 'passwordが6文字以上かつ英数字混合で登録できる' do
          @user.password = 'tarou44884'
          @user.password_confirmation = 'tarou44884'
          expect(@user).to be_valid
        end
      end

      context '新規登録がうまくいかない時' do
        it 'nicknameが空だと登録できない' do
          @user.nickname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include "Nickname can't be blank"
        end
        it 'emailが空だと登録できない' do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end

        it 'emailが重複していると登録できない' do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include('Email has already been taken')
        end

        it 'passwordが空だと登録できない' do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end

        it 'passwordが5文字以下だと登録ができない' do
          @user.password = 'aaa'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
        end

        it 'passwordに英数字が混合してなければならない' do
          @user.password = 'aaaaaa'
          @user.password_confirmation = 'aaaaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
        end

        it 'password_confirmationが空では登録できない' do
          @user.password_confirmation = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

        it '名前(全角)に入力がないと登録ができない' do
          @user.family_name = ''
          @user.last_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name can't be blank", "Last name can't be blank")
        end

        it '名前(全角)には全角(ひらがな,カタカナ,漢字)で記入しなければ登録できない' do
          @user.family_name = 'mmm'
          @user.last_name = 'mmm'
          @user.valid?
          expect(@user.errors.full_messages).to include('Family name Full-width characters', 'Last name Full-width characters')
        end

        it 'フリガナに入力がないと登録ができない' do
          @user.family_name_kana = ''
          @user.last_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name kana can't be blank", "Last name kana can't be blank")
        end

        it 'フリガナにはカタカナで記入しなければ登録できない' do
          @user.family_name_kana = 'あああ'
          @user.last_name_kana = 'あああ'
          @user.valid?
          expect(@user.errors.full_messages).to include('Family name kana Full-width katakana characters', 'Last name kana Full-width katakana characters')
        end

        it '生年月日がないと登録ができない' do
          @user.birthday = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Birthday can't be blank")
        end
      end
    end
  end
end
