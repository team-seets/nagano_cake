class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def after_sign_in_path_for(resource)
    products_path(current_customer)
  end


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
    keys: [:first_name, :last_name, :kana_first_name, :kana_last_name, :email, :postal_code, :address,:telephone_number ])

    devise_parameter_sanitizer.permit(:account_update,
    keys: [:first_name, :last_name, :kana_first_name, :kana_last_name, :email, :postal_code, :address,:telephone_number ])
  end
end
