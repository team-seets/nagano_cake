class Product < ApplicationRecord
  has_many :cart_product, dependent: :destroy
  attachment :image
  belongs_to :genre, dependent: :destroy
  enum is_active: { 売り切れ: false, 販売中: true }
end
