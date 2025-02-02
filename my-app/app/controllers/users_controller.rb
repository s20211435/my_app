class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # redirect_to @user, notice: 'ユーザーが作成されました。'
      redirect_to @user, notice: 'ユーザーが作成されました。'
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
    @events = @user.events
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user, notice: 'ユーザーが更新されました。'
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_url, notice: 'ユーザーが削除されました。'
  end

  private

  def set_user
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to users_url, alert: 'ユーザーが見つかりません。'
  end

  def user_params
    params.require(:user).permit(:name, :email, :password_digest)
  end
end
