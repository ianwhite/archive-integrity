class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def current_user
    @current_user ||= find_or_create_user
  end
  helper_method :current_user

  def find_or_create_user
    User.find_by(session_id: cookies[:user_session_id]) || create_user_and_store_cookie
  end

  def create_user_and_store_cookie
    User.create!.tap do |user|
      cookies.permanent[:user_session_id] = user.session_id
    end
  end
end
