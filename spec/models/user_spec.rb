require 'rails_helper'
RSpec.describe User, type: :model do
  
  before do
    @user = FactoryBot.build(:user)
  end


  context "新規登録がうまくいくとき" do
    it "nickname,email,password,password_confirmation,family_name_kanji,first_name_kanji,family_name_kana,first_name_kana,birthdayが存在すれば登録できること" do
      expect(@user).to be_valid
    end

    it "passwordが６文字以上であれば登録できる" do
      @user.password = "abc123"
      @user.password_confirmation = "abc123"
      expect(@user).to be_valid
    end
  end
  
  context "新規登録がうまくいかないとき" do
    it "nicknameが空では登録できない" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "emailが空では登録できない" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    
    it "メールアドレスは＠を含む" do
      @user.email = "aaa.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it "passwordが空では登録できない" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "passwordが５文字以下は登録できない" do
      @user.password = "12345"
      @user.password_confirmation = "12345"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "passwordとpassword_confirmationが不一致では登録できないこと" do
      @user.password = "123456"
      @user.password_confirmation ="1234567"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "passwordが英字のみだとユーザー登録できない" do
      @user.password = "abcdef"
      @user.password_confirmation = "abcdef"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it "passwordが数字のみだとユーザー登録できない" do
      @user.password = "123456"
      @user.password_confirmation = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it "重複したemailが存在する場合登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "姓の情報が空だとユーザー登録できない" do
    @user.family_name_kanji = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Family name kanji can't be blank")
    end

    it "名の情報が空だとユーザー登録できない" do
      @user.first_name_kanji = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kanji can't be blank")
    end

    it "姓が全角（漢字・ひらがな・カタカナ）以外だとユーザー登録できない" do
      @user.family_name_kanji = "abc" 
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kanji is invalid")
    end

    it "名が全角（漢字・ひらがな・カタカナ）以外だとユーザー登録できない" do
      @user.first_name_kanji = "abc" 
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kanji is invalid")
    end

    it "姓（フリガナ）の情報が空だとユーザー登録できない" do
      @user.family_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank")
    end

    it "姓のフリガナが全角（カタカナ）以外だとユーザー登録できない" do
      @user.family_name_kana = "abc"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana is invalid")
    end

    it "名（フリガナ）の情報が空だとユーザー登録できない" do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it "名のフリガナが全角（カタカナ）以外だとユーザー登録できない" do
      @user.first_name_kana = "abc"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end

    it "生年月日の情報が空だとユーザー登録できない" do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
