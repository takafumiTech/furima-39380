require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'emailに@が含まれていないと登録できない' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordとpassword_confirmationが一致しないと登録できない' do
      @user.password = 'test123'
      @user.password_confirmation = 'test1234'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'passwordが5文字以下では登録できない' do
      @user.password = 'test1'
      @user.password_confirmation = 'test1'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordが英数字混在ではないと登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password 英数字混在で入力してください')
    end

    it 'first_name_kanjiが空では登録できない' do
      @user.first_name_kanji = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kanji can't be blank")
    end

    it 'first_name_kanziが全角文字ではないと登録できない' do
      @user.first_name_kanji = 'koara'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kanji 全角文字を使用してください')
    end

    it 'last_name_kanjiが空では登録できない' do
      @user.last_name_kanji = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kanji can't be blank")
    end

    it 'last_name_kanziが全角文字ではないと登録できない' do
      @user.last_name_kanji = 'koara'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kanji 全角文字を使用してください')
    end

    it 'first_name_furiganaが空では登録できない' do
      @user.first_name_furigana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name furigana can't be blank")
    end

    it 'first_name_furiganaが全角カナではないと登録できない' do
      @user.first_name_furigana = '佐藤'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name furigana 全角カナを使用してください')
    end

    it 'last_name_furiganaが空では登録できない' do
      @user.last_name_furigana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name furigana can't be blank")
    end

    it 'last_name_furiganaが全角カナではないと登録できない' do
      @user.last_name_furigana = '佐藤'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name furigana 全角カナを使用してください')
    end

    it 'birthdayが空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
