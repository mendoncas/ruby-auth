class Routine::FeedbacksController < ApiController
  before_action :require_physio, only: :show

  def create
    @exercise_serie = ExerciseSerie.find_by_id(params[:serie_id])
    @routine_day = Day.find_by_date(Time.now.strftime("%Y-%m-%d"))

    @feedback = Feedback.create(exercise_serie: @exercise_serie, pain: params[:pain], effort: params[:effort],
                                description: params[:description], day: @routine_day)

    if @exercise_serie.valid? && @feedback.valid?
      render json: { success: "feedback enviado com sucesso", feedback: @feedback, exercises: @routine_day.routine }
    else
      @feedback.destroy
      render json: { error: "parâmetros inválidos" }
    end
  end

  def show
    @link = Link.find_by_default_id(params[:patient_id])
    @routine = Routine.find_by_link_id(@link.id)
    @routine_days = @routine.days
    @output = []

    @routine_days.each {
      |day|
      @output.push(day.feedbacks)
    }
    render json: @output
  end
end
