class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many_attached :images
  belongs_to :category
  belongs_to :user
  # belongs_to :buy_user, optional: true, class_name:"User", foreign_key: "buy_user_id”
  
  validates :name, presence: true,  length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :brand, presence: true
  validates :status, presence: true
  validates :send_fee, presence: true
  validates :region, presence: true
  validates :send_day, presence: true
  validates :price, presence: true, inclusion: 300..9999999
  validates :user_id, presence: true 
  validates :buy_user_id, presence: true
end
