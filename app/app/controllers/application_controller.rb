class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  helper_method :current_user, :logged_in?
  before_action :set_q

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  def require_login
    unless logged_in?
      redirect_to login_path, alert: 'You must be logged in to access this section'
    end
  end

  def redirect_if_logged_in(path = root_path)
      redirect_to path, alert: 'You are already logged in.' if logged_in?
  end

  def set_q
    @q = Game.ransack(params[:q])
  end
  
end
