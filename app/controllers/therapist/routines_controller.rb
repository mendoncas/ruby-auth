class Therapist::RoutinesController < ApiController
  def create #cria uma rotina de exercícios vazia para um paciente
    @link = Link.find_by_default_id(params[:id])
    if @link
      routine = Routine.create(beginning: params[:beginning], end: params[:end], link_id: @link.id)
      if routine.valid?
        render json: { success: "rotina criada", routine: routine }
      else routine.destroy       end
    else
      render json: { error: "você prescisa criar um link com esse paciente" }
    end
  end

  def show
    if find_physio
      render json: Routine.where(link_id: find_physio.links.ids)
    elsif find_default
      routine = Routine.find_by(link_id: find_default.link.id)
      render json: { routine: routine, exercises: ExerciseSerie.find_by_routine_id(routine.id) }
    else
      render json: "usuário inválido"
    end
  end
end
