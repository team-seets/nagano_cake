class Product < ApplicationRecord
  has_many :cart_product
  attachment :image
end
