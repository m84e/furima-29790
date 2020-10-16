require 'rails_helper'

RSpec.describe Order, type: :model do
  
  before do
    @order_address = FactoryBot.build(:order_address)
  end


  context "購入ができるとき" do
    it "購入フォームが正しく記述されている"do
      expect(@order_address).to be_valid
    end
  end

  context "購入ができないとき" do
    it "カード情報が空では購入できない" do
      @order_address.token = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end

    it "郵便番号が空では購入できない" do
      @order_address.postal_code = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
    end

    it "都道府県の情報が空では購入できない" do
      @order_address.prefectures_id = 1
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefectures must be other than 1")
    end

    it "市区町村が空では購入できない" do
      @order_address.city = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City can't be blank")
    end

    it "番地が空では購入できない" do
      @order_address.house_num = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("House num can't be blank")
    end

    it "電話番号が空では購入できない" do
      @order_address.phone_num = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone num can't be blank")
    end

    it "郵便番号にはハイフンがないと購入できない" do
      @order_address.postal_code = "1234567"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code is invalid")
    end

    it "電話番号にハイフンがあると購入できない" do
      @order_address.phone_num = "080-1234-5678"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone num is invalid")
    end

    it "電話番号が12桁以上では購入できない" do
      @order_address.phone_num = "080-1234-56789"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone num is invalid")
    end
  end
end