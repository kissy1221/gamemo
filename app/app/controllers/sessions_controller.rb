class SessionsController < ApplicationController
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

  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end

end
