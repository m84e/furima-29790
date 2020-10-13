require 'rails_helper'
RSpec.describe Item, type: :model do
  
  before do
    @item = FactoryBot.build(:item)
  end


  context "商品出品がうまくいくとき" do
    it "画像一枚と入力フォームが正しく記述されている" do
      expect(@item).to be_valid
    end
  end

  context "商品出品がうまくいかないとき" do

    it "画像が空では登録できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it "商品名が空では登録できない" do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it "商品の説明が空では登録できない" do
      @item.description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it "カテゴリーの情報が空では登録できない" do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end

    it "商品の状態についての情報が空では登録できない" do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Status must be other than 1")
    end

    it "配送料の負担についての情報が空では登録できない" do
      @item.deli_char_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Deli char must be other than 1")
    end

    it "発送元の地域についての情報が空では登録できない" do
      @item.ship_from_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Ship from must be other than 1")
    end

    it "発送までの日数についての情報が空では登録できない" do
      @item.ship_days_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Ship days must be other than 1")
    end

    it "価格についての情報が空では登録できない" do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it "価格の範囲が、¥300以上でないと登録できない" do
      @item.price = 200
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end

    it "価格の範囲が、¥9999999以下でないと登録できない" do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end

    it "販売価格は半角数字のみでないと登録できない" do
      @item.price = "abc"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
  end
end