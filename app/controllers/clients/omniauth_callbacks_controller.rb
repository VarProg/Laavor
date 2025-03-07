# frozen_string_literal: true

module Clients
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def facebook
      @user = Client.from_omniauth(request.env['omniauth.auth'])

      if @user.persisted?
        sign_in_and_redirect @user, event: :authentication
        set_flash_message(:notice, :success, kind: 'Facebook') if is_navigational_format?
      else
        session['devise.facebook_data'] = request.env['omniauth.auth'].except(:extra)
        redirect_to new_client_registration_url
      end
    end

    def failure
      redirect_to root_path
    end

    def google_oauth2
      @user = Client.from_omniauth(request.env['omniauth.auth'])

      if @user.persisted?
        sign_in_and_redirect @user, event: :authentication
        set_flash_message(:notice, :success, kind: 'Google') if is_navigational_format?
      else
        session['devise.google_data'] = request.env['omniauth.auth'].except('extra')
        redirect_to new_client_registration_url, alert: @user.errors.full_messages.join("\n")
      end
    end
  end
end
