class Product < ApplicationRecord
  has_many :cart_product
  attachment :image
  # mount_uploader :image, ImageUploader
  mount_uploader :image, ImageUploader
  belongs_to :genre, dependent: :destroy

end
