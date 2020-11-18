class CustomersController < ApplicationController

  def index
  end

  def show
    # @user = User.find(params[:id])
  end

  def edit
    # @user = User.find(params[:id])
    # if current_user.id != @user.user_id
      # redirect_to customer_path(current_user.id)
    # end
  end

  def update
     @user = User.find(params[:id])
    if @user.save(user_params)
      redirect_to customer_path
    else
      render 'edit'
    end
  end

  def destroy
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
