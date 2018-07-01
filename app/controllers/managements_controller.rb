class ManagementsController < ApplicationController
  before_action :admin_create_user, only: [:manage_user ,:create]

  def manage_user
    @user = User.new
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        flash[:notice] = "User lalla"
        format.html { redirect_to root_path, notice: 'User was successfully created.'}
      else
        format.html { redirect_to managements_manage_user_path, notice: 'Error, User already exist'}
      end
    end
  end

  protected

  def admin_create_user
    if current_user != User.first
      redirect_to root_path
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:email, :password)
  end

end
