class Customers::SearchController < ApplicationController
  before_action :authenticate_customer!

	def search
		@products = Product.all
		@word = params[:search_word]
		method = params[:search_method]
		model = params[:search_model]
		@product = Product.search(method,@word)
		if model == 'Product'
	    @products = Product.search(method,@word)
	  end
	  pp @products
	end
	
  def products
    @value = params["search"]["value"]         #データを代入
    @how = params["search"]["how"]             #データを代入
    @datas = search_for(@how, @value)          #def search_forを実行(引数に検索ワードと検索方法)
  end

  private

  def match(value)
    #.orを使用することで、valueに一致するカラムのデータをnameカラムとgenre_idカラムから探してきます。
    Product.where(name: value).or(Product.where(genre_id: value))
  end

  def forward(value)                              #forward以降は商品名検索の定義しかしてません。
    Product.where("name LIKE ?", "#{value}%")        
  end

  def backward(value)
    Product.where("name LIKE ?", "%#{value}")
  end

  def partical(value)
    Product.where("name LIKE ?", "%#{value}%")
  end


  def search_for(how, value)
    case how                     #引数のhowと一致する処理に進むように定義しています。
    when 'match'                 #ジャンル検索の場合はmatchで固定してるので、必ず'match'の処理に進みます。
      match(value)
    when 'forward'
      forward(value)
    when 'backward'
      backward(value)
    when 'partical'
      partical(value)
    end
  end
end
