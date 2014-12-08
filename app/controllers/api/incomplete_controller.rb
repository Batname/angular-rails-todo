class Api::IncompleteController < Api::BaseController

  def index
    render json: Task.all.incompleted
  end

end
