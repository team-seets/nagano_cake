class Product < ApplicationRecord
  has_many :cart_product
<<<<<<< HEAD
  attachment :image
  mount_uploader :image, ImageUploader
=======
  belongs_to :genre, dependent: :destroy
>>>>>>> 29e401fcc9939a7bbd454056c96bff79592f41c9
end
