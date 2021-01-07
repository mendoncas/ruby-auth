class PhysiosController < ApplicationController
  before_action :require_physio, only: [:generate_token]

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

  #gera um token para o paciente a partir do id do fisioterapeuta
  def generate_token
    @physio = find_physio
    token = encode_token(physio: @physio.id)
    render json: token
  end

  private

  def find_physio
    if decoded_token
      user_id = decoded_token[0]["user_id"]
      physio = Physio.find_by(user: user_id)
    end
  end

  private

  def require_physio
    if !find_physio
      render json: { error: "você deve ser um fisioterapeuta para realizar essa ação" }
    end
  end
end
