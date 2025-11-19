class SessionsController < ApplicationController

  before_action :redirect_if_logged_in, only: [:new, :create]
  before_action :require_login, only: [:destroy]

  def new
  end

  # ログイン処理
  def create
    user = User.find_by(email: session_params[:email])
    Rails.logger.debug "入力パスワード：#{session_params[:password]}"
    if user&.authenticate(session_params[:password])
      Rails.logger.debug "ログイン成功"
      session[:user_id] = user.id
      redirect_to root_url, notice: 'Logged in successfully.'
    else
      Rails.logger.debug "ログイン失敗"
      render :new, status: :unprocessable_entity
    end

  end

  # ログアウト処理  
  def destroy
    reset_session
    redirect_to root_url, notice: 'Logged out successfully.'
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end

  def redirect_if_logged_in
      redirect_to root_path, alert: 'You are already logged in.' if logged_in?
  end

end
