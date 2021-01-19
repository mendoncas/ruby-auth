class Routine::DaysController < ApplicationController
  def update
    @day = Day.find_by_date(Time.now.strftime("%Y-%m-%d"))

    if @day
      @day.status = params[:status]
      render json: { success: "status do dia alterado!" }
    else
      render json: { error: "dia não encontrado" }
    end
  end
end
