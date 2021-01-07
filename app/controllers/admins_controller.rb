class AdminsController < ApplicationController
  def show
    render json: Admin.all
  end

  def create
    @user = new_user
    @admin = Admin.create(user: @user)

    if @user.valid? && @admin.valid?
      render json: { user: @user, admin: @admin }
    else
      User.destroy(@user.id)
      render json: { error: "parâmetros inconpatíveis" }
    end
  end
end
