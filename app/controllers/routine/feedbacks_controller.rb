class Routine::FeedbacksController < ApplicationController
  def create
    @exercise_serie = ExerciseSerie.find_by_id(params[:serie_id])
    @routine_day = Day.find_by_date(Time.now.strftime("%Y-%m-%d"))

    @feedback = Feedback.create(exercise_serie: @exercise_serie, pain: params[:pain], effort: params[:effort],
                                observation: params[:observation], day: @routine_day)

    render json: { routine_day: @routine_day, date: Time.now.strftime("%Y-%m-%d") }
    # @feedback.destroy
    # if @exercise_serie.valid? && @feedback.valid?
    #   render json: { success: "feedback enviado com sucesso", feedback: @feedback }
    # else
    #   render json: { error: "parâmetros inválidos" }
    # end
  end
end
