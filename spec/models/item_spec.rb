require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    context '商品を保存できる場合' do
      it '全ての項目に記載があれば保存' do
        item = build(:item)
        expect(item).to be_valid
      end

      it 'サイズが空欄でも保存できる' do
        item = build(:item, size_id: nil)
        expect(item).to be_valid
      end

      it 'ブランドが空欄でも保存できる' do
        item = build(:item, brand: nil)
        expect(item).to be_valid
      end
    end
      

    context '商品を保存できない場合' do
      it '画像無しでは保存できない' do
        item = build(:item)
        item.images = []
        item.valid?
        expect(item.errors[:images]).to include("を入力してください")
      end

      it '商品名無しで保存できない' do
        item = build(:item, name: nil)
        item.valid?
        expect(item.errors[:name]).to include("を入力してください")
      end

      it '商品名が41文字以上だと保存できない' do
        item = build(:item, name: 41.times.inject("") { |str| str.concat([*"ぁ".."ん"].sample) } )
        item.valid?
        expect(item.errors[:name]).to include("は40文字以内で入力してください")
      end

      it '商品説明がないと保存できない' do
        item = build(:item, introduction: nil)
        item.valid?
        expect(item.errors[:introduction]).to include("を入力してください")
      end

      it '商品説明が1001文字以上だと保存できない' do
        item = build(:item, introduction: 1001.times.inject("") { |str| str.concat([*"ぁ".."ん"].sample) } )
        item.valid?
        expect(item.errors[:introduction]).to include("は1000文字以内で入力してください")
      end

      it 'カテゴリが空欄、２段目までだと保存できない' do
        item = build(:item, category: nil)
        item.valid?
        expect(item.errors[:category]).to include("を入力してください")
      end

      it '商品の状態がないと保存できない' do
        item = build(:item, condition_id: nil)
        item.valid?
        expect(item.errors[:condition_id]).to include("を入力してください")
      end

      it '配送料の入力がないと保存できない' do
        item = build(:item, shipping_cost_id: nil)
        item.valid?
        expect(item.errors[:shipping_cost_id]).to include("を入力してください")
      end

      it '発送元の地域の入力がないと保存できない' do
        item = build(:item, prefecture_id: nil)
        item.valid?
        expect(item.errors[:prefecture_id]).to include("を入力してください")
      end

      it '発送までの日数の入力がないと保存できない' do
        item = build(:item, shipping_days_id: nil)
        item.valid?
        expect(item.errors[:shipping_days_id]).to include("を入力してください")
      end

      it '価格が¥300未満だと登録できない' do
        item = build(:item, price: 299 )
        item.valid?
        expect(item.errors[:price]).to include("を¥300〜¥9,999,999の間で入力してください")
      end

      it '価格が¥10000001以上だと登録できない' do
        item = build(:item, price: 10000000 )
        item.valid?
        expect(item.errors[:price]).to include("を¥300〜¥9,999,999の間で入力してください")
      end

    end
  end
end