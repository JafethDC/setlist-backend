class ApplicationController < ActionController::API
  include ActionController::Cookies

  def current_user
    token = JsonWebToken.decode(cookies[:token])
    return nil if token.nil?

    User.find_by_id(token[:user_id])
  end
end
