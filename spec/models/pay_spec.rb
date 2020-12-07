require 'rails_helper'
describe Pay do
  describe '#create' do
    it "全て入力されていればOK" do
      pay = build(:pay)
      expect(pay).to be_valid
    end
    it "user_idが無い場合は登録できないこと" do
      pay = build(:pay, user_id: nil)
      pay.valid?
      expect(pay.errors[:user_id]).to include("を入力してください")
    end
    it "customer_idが無い場合は登録できないこと" do
      pay = build(:pay, customer_id: nil)
      pay.valid?
      expect(pay.errors[:customer_id]).to include("を入力してください")
    end
    it "card_idが無い場合は登録できないこと" do
      pay = build(:pay, card_id: nil)
      pay.valid?
      expect(pay.errors[:card_id]).to include("を入力してください")
    end
  end
end
