class Customer < ApplicationRecord
  # validates :first_name, presence: true
  # validates :last_name, presence: true
  # validates :first_name_kana, presence: true
  # validates :last_name_kana, presence: true
  # validates :email, presence: true
  # validates :postal_code, presence: true
  # validates :address, presence: true
  # validates :telephone_number, presence: true
  # validates :encrypted_password, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :orders
  has_many :cart_products
  has_many :addresses

  def active?
    super && (self.is_deleted == false)
  end


   enum is_deleted: {"有効": false, "退会済み": true}


  def self.search(method,word)
    if method == "perfect_match"
      customer = Customer.where("(first_name || last_name)='#{word}'")
    elsif method == "partial_match"
      customer = Customer.where("(first_name || last_name)LIKE ?","%#{word}%")
    end
  end


end
