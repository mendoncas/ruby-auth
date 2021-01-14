class Therapist::RoutinesController < ApiController
  def create #cria uma rotina de exercícios vazia para um paciente
    @link = Link.find_by_default_id(params[:id])
    if @link
      Routine.create(beginning: params[:beginning], end: params[:end], link_id: @link.id)
      render json: {success: "rotina criada"}
    else
      render json: {error: "você prescisa criar um link com esse paciente"}
    end
  end
end
