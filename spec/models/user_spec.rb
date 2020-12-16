require 'rails_helper'

describe User do
  describe '#create' do
    it "全て入力されていれば登録できる" do
      user = build(:user)
      expect(user).to be_valid
    end
    it "nicknameが空なら登録できない" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end
    it "emailが空なら登録できない" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end
    it "emailが意図しない形なら登録できない" do
      user = build(:user, email: "aaagmail.com")
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
    end
    it "emailが重複していたら登録できない" do
      user1 = create(:user)
      expect(build(:user, email: user1.email)).to_not be_valid
    end
    it "passwordが空なら登録できない" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end
    it "passwordが7文字よりも短ければ登録できない" do
      user = build(:user, password: "aaa111")
      user.valid?
      expect(user.errors[:password]).to include("は7文字以上で入力してください")
    end

    it "firstnameが空なら登録できない" do
      user = build(:user, firstname: nil)
      user.valid?
      expect(user.errors[:firstname]).to include("を入力してください")
    end
    it "lastnameが空なら登録できない" do
      user = build(:user, lastname: nil)
      user.valid?
      expect(user.errors[:lastname]).to include("を入力してください")
    end
    it "firstname_kanaが空なら登録できない" do
      user = build(:user, firstname_kana: nil)
      user.valid?
      expect(user.errors[:firstname_kana]).to include("を入力してください")
    end
    it "lastname_kanaが空なら登録できない" do
      user = build(:user, lastname_kana: nil)
      user.valid?
      expect(user.errors[:lastname_kana]).to include("を入力してください")
    end
    it "birthが空なら登録できない" do
      user = build(:user, birth: nil)
      user.valid?
      expect(user.errors[:birth]).to include("を入力してください")
    end
  end
end