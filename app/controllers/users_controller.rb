class UsersController < ApplicationController
  before_action :authorized, only: [:auto_login, :destroy]

  def index
    render json: User.all
  end

  def destroy
    if is_admin
      @user = User.find_by(id: params[:id])
      render json: { user: @user }
      User.destroy(@user.id)
    else
      render json: { error: "você não tem permissão para isso" }
    end
  end

  def login
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      token = encode_token({ user_id: @user.id })
      render json: { user: @user, token: token }
    else
      render json: { error: "invalid username or password" }
    end
  end

  def auto_login
    render json: @user
  end
end
