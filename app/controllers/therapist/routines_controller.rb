class Therapist::RoutinesController < ApiController
  def create #cria uma rotina de exercícios vazia para um paciente
    @link = Link.find_by_default_id(params[:id]) #espera o id do paciente (default.id)
    if @link
      @routine = Routine.create(beginning: params[:beginning], end: params[:end], link_id: @link.id)

      if @routine.valid?
        dates = (@routine.beginning..@routine.end).to_a

        if dates
          puts "gerando os dias da rotina"
          dates.each {
            |d|
            #staus 0 = incompleto, 1 = em progresso, 2 = completo
            Day.create(status: 0, date: d, routine: @routine) #muito lento! 
          }

          render json: { success: "rotina criada", routine: @routine, days: @routine.days } #routine.days não ta funcionando crlhhh
        else render json: "datas inválidas"         end
      else @routine.destroy       end
    else
      render json: { error: "você prescisa criar um link com esse paciente" }
    end
  end

  def show 
    if find_physio  #retorna ao fisioterapeuta todas as rotinas dos seus pacientes
      render json: Routine.where(link_id: find_physio.links.ids)
    
    elsif find_default #retorna ao paciente a sua rotina, com exercícios
      @routine = Routine.find_by(link_id: find_default.link.id)
      render json: { routine: @routine, exercises: ExerciseSerie.where(routine_id: @routine.id), days: @routine.days }
      # render json: { routine: @routine, exercises: @routine.exercise_series, days: @routine.days }

    else
      render json: "usuário inválido"
    end
  end
end
