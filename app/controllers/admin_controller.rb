class AdminController < ApplicationController
  def show
    render json: Admin.all
  end

  def create
    @user = new_user
    if @user.valid?
      token = encode_token({ user_id: @user.id })
      #   render json: { user: @user, token: token }
    else
      render json: { error: "invalid" }
    end
    @admin = Admin.create(user: @user)
    render json: { user: @user, adm: @admin }
  end
end
