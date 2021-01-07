class DefaultsController < ApplicationController
  before_action :require_default, only: [:generate_link]

  def show
    render json: Default.all
  end

  def create
    @user = new_user
    @default = Default.create(user: @user, description: params[:description])

    if @user.valid? && @default.valid?
      render json: { user: @user, default: @default }
    else
      User.destroy(@user.id)
      render json: { error: "parâmetros inconpatíveis" }
    end
  end

  def generate_link
    token = params[:string]
    decoded = JWT.decode(token, "meusegredo", true, algorithm: "HS256")
    render json: decoded
  end

  private

  def find_default
    if decoded_token
      user_id = decoded_token[0]["user_id"]
      default = Default.find_by(user: user_id)
    end
  end

  private

  def require_default
    if !find_default
      render json: { error: "você deve ser um paciente para realizar essa ação" }
    end
  end
end
