class ApplicationController < ActionController::Base
    before_action :set_current_user
    # geting this error -> Can't verify CSRF token authenticity.
    protect_from_forgery unless: -> { request.format.json? }

    def set_current_user
        Current.user = User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def require_user_logged_in!
        redirect_to sign_in_path, alert: 'You must be signed in' if Current.user.nil?
    end
end
