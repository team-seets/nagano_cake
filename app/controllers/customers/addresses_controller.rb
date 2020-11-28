class Customers::AddressesController < ApplicationController

  def new
    @address = Address.new
  end

  def index
    @address = Address.new
    @addresses = current_customer.addresses
    # @address = Address.find(params[:id])
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    @address.save!
    redirect_to addresses_path
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
     @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to  addresses_path, notice: ''
    else
      render 'edit'
    end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    flash[:success] = 'ユーザーを削除しました。'
    redirect_to addresses_path
  end

  private
  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end

end
