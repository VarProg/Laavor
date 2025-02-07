# frozen_string_literal: true

module Admins
  class RegistrationsController < Devise::RegistrationsController
    layout 'profile_layout', except: %i[new create]
    before_action :configure_sign_up_params, only: [:create], if: :devise_controller?
    before_action :configure_account_update_params, only: [:update], if: :devise_controller?

    # GET /resource/sign_up
    # def new
    #   redirect_to new_user_session_path and return
    #   super
    # end

    # POST /resource
    # def create
    #   super
    # end

    # GET /resource/edit
    # def edit
    #   super
    # end

    # PUT /resource
    # def update
    #   super
    # end

    # DELETE /resource
    # def destroy
    #   super
    # end

    # GET /resource/cancel
    # Forces the session data which is usually expired after sign
    # in to be expired now. This is useful if the user wants to
    # cancel oauth signing in/up in the middle of the process,
    # removing all OAuth session data.
    # def cancel
    #   super
    # end

    protected

    # If you have extra params to permit, append them to the sanitizer.

    def sign_up_params
      devise_parameter_sanitizer.sanitize(:sign_up) { |admin| admin.permit(permitted_attributes) }
    end

    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up, keys: permitted_attributes)
    end

    def permitted_attributes
      %i[ email phone password password_confirmation locale
          first_name last_name avatar remove_avatar gender birthday city]
    end

    # If you have extra params to permit, append them to the sanitizer.
    def configure_account_update_params
      devise_parameter_sanitizer.permit(:account_update, keys: permitted_attributes)
    end

    def after_update_path_for(_resource)
      edit_admin_registration_path
    end
  end
end
