class Api::CompleteController < Api::BaseController

  def index
    render json: Task.all.completed
  end

end
