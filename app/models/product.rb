class Product < ApplicationRecord

  has_many :cart_product, dependent: :destroy

  attachment :image
  has_many :order_details, dependent: :destroy
  
  belongs_to :genre
  enum is_active: { 売り切れ: false, 販売中: true }
end
