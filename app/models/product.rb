class Product < ApplicationRecord
  has_many :cart_product
  attachment :image
  # mount_uploader :image, ImageUploader
  belongs_to :genre, dependent: :destroy
  enum is_active: { 売り切れ: false, 販売中: true }
end
