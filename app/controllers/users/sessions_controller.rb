# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController

  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create

  #   protect_from_forgery with: :exception
  # before_action :authorize

  # def authorize
  #     if current_user.present?
  #       if current_user.has_role? :admin
  #         redirect_to admin_index_path
  #         # render plain:"No access for you!"
  #       else
  #         redirect_to root_path
  #       end
  #   end
  # end

    # if user.has_role :admin

    #   redirect_to new_user_registration_path
      
    # end
    @user = User.find_by_email(params[:user][:email])
    if @user.present?
      if @user.valid_password?(params[:user][:password])
        sign_in @user
        if @user.has_role? :admin
           redirect_to admin_index_path
        else
           redirect_to root_path
        end
      else
        redirect_to :root
      end
    else
      redirect_to :root
    end
    
    # super
  end

  # DELETE /resource/sign_out
  def destroy
    super
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  end
end
