class Customers::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
     @customer = Customer.find(params[:id])
  end

  def update
     @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to customer_path, notice: ''
    else
      render 'edit'
    end
  end

  def withdraw
    current_customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end

  def self.search(word)
  end

 private
    def customer_params
       params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email)
    end
end