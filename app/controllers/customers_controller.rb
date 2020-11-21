class CustomersController < ApplicationController
<<<<<<< HEAD
  
  def index
     @user = User.find(params[:id])
  end

  def show
    # @user = User.find(params[:id])
=======
  before_action :authenticate_customer!

  def show
    @customer = Customer.find(params[:id])
>>>>>>> fee0116a4afc191c4db8b595daf2e64de7a906ef
  end

  def edit
     @customer = Customer.find(params[:id])
<<<<<<< HEAD
    # if current_user.id != @user.user_id
      # redirect_to customer_path(current_user.id)
    # end
  end

  def update
     @user = User.find(params[:id])
    if @user.save(user_params)
=======
  end

  def update
     @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
>>>>>>> fee0116a4afc191c4db8b595daf2e64de7a906ef
      redirect_to customer_path, notice: ''
    else
      render 'edit'
    end
  end

  def destroy
<<<<<<< HEAD
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = 'ユーザーを削除しました。'
    redirect_to root
  end

 private
    def user_params
       params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email)
    end

end
=======
    @customer = Customer.find(params[:id])
    @customer.destroy
    flash[:success] = 'ユーザーを削除しました。'
    redirect_to root_path
  end

 private
    def customer_params
       params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email)
    end

end
>>>>>>> fee0116a4afc191c4db8b595daf2e64de7a906ef
