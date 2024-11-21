require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.png')
    binding.pry
  end

  describe '商品出品機能' do
    context '商品出品が上手く登録できる時' do
      it '全ての項目を記入していれば登録できる' do
        expect(@item).to be_valid
      end

      it '価格の範囲が、¥300~¥9,999,999の間である場合登録できる' do
        @item.price = 3333
        expect(@item).to be_valid
      end
    end

    context '商品出品が上手く登録できない時' do
      it 'imageが空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が空だと登録できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '商品説明が空だと登録できない' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'カテゴリーを選択しないと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages). to include('Category select')
      end

      it '商品の状態を選択しないと登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition select')
      end

      it '配送料の負担を選択しないと登録できない' do
        @item.burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Burden select')
      end

      it '発送元の地域を選択しないと登録できない' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Area select')
      end

      it '配送までの日数を選択しないと登録できない' do
        @item.delivery_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery day select')
      end

      it '販売価格を記入しないと登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '販売価格が300円以上でなければ登録できない' do
        @item.price = 129
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end

      it '販売価格が9999999円いないでなければならない' do
        @item.price = 1_000_000_000_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
    end
  end
end
