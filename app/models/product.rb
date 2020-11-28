class Product < ApplicationRecord

  has_many :cart_product, dependent: :destroy

  attachment :image
  has_many :order_details, dependent: :destroy

  belongs_to :genre
  enum is_active: { 売り切れ: false, 販売中: true }

  def self.search(method,word)
    if method == "perfect_match"
      Product.where("name = ?", word)
    elsif method == "partial_match"
      Product.where("name LIKE ?","%#{word}%")
    end
  end
end
