require 'rails_helper'

describe Product do

  describe '#create' do
    it "商品名がない場合は登録できないこと" do
      product = build(:product, name: nil)
      product.valid?
      expect(product.errors[:name]).to include("can't be blank")
    end

    it "商品説明がない場合は登録できないこと" do
      product = build(:product, description: nil)
      product.valid?
      expect(product.errors[:description]).to include("can't be blank")
    end

    it "商品の状態がない場合は登録できないこと" do
      product = build(:product, status: nil)
      product.valid?
      expect(product.errors[:status]).to include("can't be blank")
    end

    it "商品の発送方法がない場合は登録できないこと" do
      product = build(:product, send_fee: nil)
      product.valid?
      expect(product.errors[:send_fee]).to include("can't be blank")
    end

    it "商品の発送地域がない場合は登録できないこと" do
      product = build(:product, region_id: nil)
      product.valid?
      expect(product.errors[:region_id]).to include("can't be blank")
    end

    it "商品の発送日数がない場合は登録できないこと" do
      product = build(:product, send_day: nil)
      product.valid?
      expect(product.errors[:send_day]).to include("can't be blank")
    end

    it "商品の金額がない場合は登録できないこと" do
      product = build(:product, price: nil)
      product.valid?
      expect(product.errors[:price]).to include("can't be blank")
    end
  end

  describe '#update' do
    it "商品名がない場合は登録できないこと" do
      product = build(:product, name: nil)
      product.valid?
      expect(product.errors[:name]).to include("can't be blank")
    end

    it "商品説明がない場合は登録できないこと" do
      product = build(:product, description: nil)
      product.valid?
      expect(product.errors[:description]).to include("can't be blank")
    end

    it "商品の状態がない場合は登録できないこと" do
      product = build(:product, status: nil)
      product.valid?
      expect(product.errors[:status]).to include("can't be blank")
    end

    it "商品の発送方法がない場合は登録できないこと" do
      product = build(:product, send_fee: nil)
      product.valid?
      expect(product.errors[:send_fee]).to include("can't be blank")
    end

    it "商品の発送地域がない場合は登録できないこと" do
      product = build(:product, region_id: nil)
      product.valid?
      expect(product.errors[:region_id]).to include("can't be blank")
    end

    it "商品の発送日数がない場合は登録できないこと" do
      product = build(:product, send_day: nil)
      product.valid?
      expect(product.errors[:send_day]).to include("can't be blank")
    end

    it "商品の金額がない場合は登録できないこと" do
      product = build(:product, price: nil)
      product.valid?
      expect(product.errors[:price]).to include("can't be blank")
    end
  end
end

describe Card do
  describe "index" do
    it "cardが存在していない場合は登録してあるカードは表示されない" do
      card = Card.new()
  end
end