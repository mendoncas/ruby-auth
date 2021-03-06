class Routine::LinksController < ApiController
  before_action :require_default, only: :create
  before_action :require_physio, only: :find_links

  def index #para o fisioterapeuta, retorna todos as ligações com pacientes
    @current = find_physio
    render json: { current: @current, found: Link.where(physio_id: @current.id) }
  end

  def create #usuário cria um link com o token do fisio. espera um json {"string": token}
    @default = find_default
    decoded = JWT.decode(params[:string], "meusegredo", true, algorithm: "HS256")

    if Link.find_by(default: @default, is_active: true)
      render json: { error: "esse usuário já está ligado a um fisioterapeuta" }
    else
      physio = Physio.find_by_id(decoded[0]["physio"])
      link = Link.create(physio_id: physio.id, default: @default, is_active: true)
     
      render json: {success: "ligação cirada com terapeuta #{physio.user.username}",link: link}
    end
  end
end
