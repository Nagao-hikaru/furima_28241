require 'rails_helper'

RSpec.describe ItemAddress, type: :model do
  describe '購入情報の保存' do
    before do
      @item_address = FactoryBot.build(:item_address)
    end

    it '全ての値が正しく入力されていれば保存できること' do
      expect(@item_address).to be_valid
    end

    it '建物名が空でも保存できること'do
      @item_address.building = nil
      expect(@item_address).to be_valid
    end

    it 'token情報がないと保存できない' do
      @item_address.token = ""
      @item_address.invalid?
      expect(@item_address.errors.full_messages).to include("Token can't be blank")
    end

    it '郵便番号が空だと保存できない' do
      @item_address.postal_code = ""
      @item_address.invalid?
      expect(@item_address.errors.full_messages).to include("Postal code can't be blank")
    end

    it '郵便番号にハイフンをつけないと保存できない' do
      @item_address.postal_code = "3333434"
      @item_address.invalid?
      expect(@item_address.errors.full_messages).to include("Postal code is invalid")
    end

    it '都道府県を選択しないと登録できない' do
      @item_address.area_id = 1
      @item_address.invalid?
      expect(@item_address.errors.full_messages).to include("Area must be other than 1")
    end

    it '番地が空だと保存できない' do
      @item_address.address = ""
      @item_address.invalid?
      expect(@item_address.errors.full_messages).to include("Address can't be blank")
    end

    it '市町区村が空だと登録できない' do
      @item_address.city = ""
      @item_address.invalid?
      expect(@item_address.errors.full_messages).to include("City can't be blank")
    end

    it '電話番号が空だと登録できない' do
      @item_address.tel = ""
      @item_address.invalid?
      expect(@item_address.errors.full_messages).to include("Tel can't be blank")
    end

    it '電話番号は10桁か11桁でなければならない' do
      @item_address.tel = "333"
      @item_address.invalid?
      expect(@item_address.errors.full_messages).to include("Tel is invalid")
    end
  end
end
