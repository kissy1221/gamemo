class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  # ユーザ登録
  def create
      @user = User.new(user_params)

      if @user.save
        redirect_to root_url, notice: 'User was successfully created.'
      else
        render :new
      end
  end

  # ユーザ詳細情報
  def show
  end

  # ユーザ情報編集
  def edit
    @user = User.find(params[:id])
  end

  # ユーザ情報更新
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to root_url
    else
      render :edit
    end
  end

  # ユーザ削除（退会)
  def destroy
    @user = current_user
    if @user.destroy
      reset_session
      redirect_to root_url, notice: 'User was successfully destroyed.'
    else
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
