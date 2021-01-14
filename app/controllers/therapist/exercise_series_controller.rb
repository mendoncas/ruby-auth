class Therapist::ExerciseSeriesController < ApiController
  def create
    @exercise = Exercise.find_by_name(params[:name])
    @link = Link.find_by_id(params[:id])

    if @exercise.valid && @link.valid?
      @serie = ExerciseSerie.create(exercise_id: @exercise.id, sets: params[:sets], reps: params[:reps], link_id: @link.id)
      if @serie.valid?
        render json: @serie
      else
        @serie.destroy
        render json: "parâmetros inválidos"
      end
    else
      render json: "parâmetros inválidos"
    end
  end
end
