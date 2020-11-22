class Product < ApplicationRecord
  has_many :cart_products, dependent: :destroy
  attachment :image
  has_many :order_details, dependent: :destroy
  # mount_uploader :image, ImageUploader
  belongs_to :genre
  enum is_active: { 売り切れ: false, 販売中: true }
end
