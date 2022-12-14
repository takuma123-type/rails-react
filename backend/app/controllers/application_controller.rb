class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken

  skip_before_action :verify_authenticity_token
  helper_method :current_user, :user_signed_in?

  protected
  def skip_session
    request.session_options[:skip] = true
  end
end
