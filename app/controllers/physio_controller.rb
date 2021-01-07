class PhysioController < ApplicationController
  def show
    render json: Physio.all
  end

  def create
    @user = new_user
    @physio = Physio.create(user: @user, crefito: params[:crefito])

    if @user.valid? && @physio.valid?
      render json: { user: @user, physio: @physio }
    else
      User.destroy(@user.id)
      render json: { error: "parâmetros inválidos" }
    end
  end
end
