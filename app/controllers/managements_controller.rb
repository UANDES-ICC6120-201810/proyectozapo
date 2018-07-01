class ManagementsController < ApplicationController
  def manage_user
    @user = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
  end
end
