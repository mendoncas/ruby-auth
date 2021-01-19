class Therapist::ExerciseSeriesController < ApiController
  def create
    @exercise = Exercise.find_by_name(params[:exercise])
    @link = find_physio.links.find_by_default_id(params[:id])
    @routine = Routine.find_by_link_id(@link.id)

    puts @link.default_id

    if @link && @exercise
      @serie = ExerciseSerie.create(exercise_id: @exercise.id, sets: params[:sets], reps: params[:reps], routine: @routine)
      if @serie.valid?
        render json: {success: @serie, patient: @link.default, routine: @routine}
      else
        @serie.destroy
        render json: "parâmetros inválidos"
      end
    else
      render json: { error: "parâmetros inválidos. link ou exercício inexistente" }
    end
  end
end
