class User::LinksController < ApiController
  before_action :require_default, only: :create
  before_action :require_physio, only: :find_links

  def show
    render json: Link.all
  end

  def find_links #para o fisioterapeuta, retorna todos as ligações com pacientes
    @current = find_physio
    render json: {current: @current, links: Link.all, found: Link.where(physio_id: @current.id)}
  end

  def create
    @default = find_default
    decoded = JWT.decode(params[:string], "meusegredo", true, algorithm: "HS256")

    if Link.find_by(default: @default, is_active: true)
      render json: { error: "esse usuário já está ligado a um fisioterapeuta" }
    else
      link = Link.create(physio_id: decoded[0]["physio"], default: @default, is_active: true)
      render json: link
    end
  end
end
