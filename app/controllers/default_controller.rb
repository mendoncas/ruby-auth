class DefaultController < ApplicationController
  def show
    render json: Default.all
  end

  def create
    @user = new_user
    @default = Default.create(user: @user, description: params[:description])
  end
end
