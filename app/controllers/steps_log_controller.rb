class StepsLogController < ApplicationController
  
  def create
    @steps_log = StepsLog.new(step_log_params)
    if @steps_log.save
      render json: @steps_log
    else
      error = { error: "Could not save steps log. #{ @steps_log.errors.full_messages }" }
      render json: error
    end
  end

  def step_log_params
    params.require(:step_log).permit(:steps, :start_time, :end_time, :device_id)
  end
end
