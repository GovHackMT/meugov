class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def self.provides_callback_for(provider)
    class_eval %Q{
      def #{provider}
        @user = User.from_omniauth(env["omniauth.auth"])

        if @user.persisted?
          sign_in_and_redirect @user, event: :authentication
          set_flash_message!(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
        else
          session["devise.#{provider}_data"] = env["omniauth.auth"]
          redirect_to new_user_registration_url
        end
      end
    }
  end

  [:facebook, :github].each do |provider|
    provides_callback_for provider
  end

  def failure
     set_flash_message! :alert, :failure, kind: OmniAuth::Utils.camelize(failed_strategy.name), reason: failure_message
    redirect_to root_path
  end

  # Sets flash message if is_flashing_format? equals true
  def set_flash_message!(key, kind, options = {})
    if is_flashing_format?
      set_flash_message(key, kind, options)
    end
  end
end
