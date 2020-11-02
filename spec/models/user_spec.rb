require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "firstname,lastname,firstname_alias,lastname_alias,nickname,
        birthday,email,password,password_confirmationが存在すれば登録できること" do
      expect(@user).to be_valid
    end

    it 'firstnameが空では登録できないこと' do
      @user.firstname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname can't be blank")
    end

    it 'lastnameが空では登録できないこと' do
      @user.lastname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Lastname can't be blank")
    end

    it 'firstname_aliasが空では登録できないこと' do
      @user.firstname_alias = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname alias can't be blank")
    end

    it 'lastname_aliasが空では登録できないこと' do
      @user.lastname_alias = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Lastname alias can't be blank")
    end

    it 'nicknameが空では登録できないこと' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'birthdayが空では登録できないこと' do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

    it 'emailが空では登録できないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'passwordが空では登録できないこと' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが６文字以上の半角英数字であれば登録できること' do
      @user.password = 'aiueo10'
      @user.password_confirmation = 'aiueo10'
      expect(@user).to be_valid
    end

    it 'passwordが5文字以下であれば登録できないこと' do
      @user.password = 'aiu10'
      @user.password_confirmation = 'aiu10'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)', 'Password 6文字以上の半角英数字')
    end

    it 'passwordとpassword_confirmationが不一致では登録できないこと' do
      @user.password = 'aiueo10'
      @user.password_confirmation = 'aiueo15'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it '重複したemailがある場合登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
  end
end
