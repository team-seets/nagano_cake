class CustomersController < ApplicationController

  def show
    @users = User.all
    @user = User.find(params[:id])
  end

  def edit
    # @user = User.find(params[:id])
  end

  def update
     user = User.find(params[:id])
     user.update(user_params)
     redirect_to customer_path(user.id)
  end

   def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = 'ユーザーを削除しました。'
    redirect_to :top
  end

 private
    def user_params
       params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, )
    end

end
