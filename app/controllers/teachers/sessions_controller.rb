# frozen_string_literal: true

class Teachers::SessionsController < Devise::SessionsController

  include Accessible
  skip_before_action :check_user, only: :destroy
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
   def new
    if current_admin
      redirect_to root_path, alert: "You are already signed in."
    else
       super
    end
   end

  # POST /resource/sign_in
   def create
    if current_admin
      redirect_to root_path, alert: "You are already signed in."
    else
       super
    end
   end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
