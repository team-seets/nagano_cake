class Product < ApplicationRecord
  has_many :cart_product
  belongs_to :genre, dependent: :destroy
end
