class Product < ApplicationRecord
  has_many :cart_product
  attachment :image
  mount_uploader :image, ImageUploader
end
