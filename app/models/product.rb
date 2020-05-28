class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :region
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  enum status: {
    新品、未使用: 0, 
    目立った傷や汚れなし: 1, 
    やや傷や汚れあり: 2, 
    傷や汚れあり: 3, 
    全体的に状態が悪い: 4
  }

  enum send_fee: {
    送料込み（出品者負担）: 0, 
    着払い（購入者）: 1
  }

  enum send_day: {
    １〜２日で発送: 0, 
    ２〜３日で発送: 1, 
    ４〜７日で発送: 2
  }
end
