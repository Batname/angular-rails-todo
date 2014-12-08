class Api::TasksController < Api::BaseController

  def index
    render json: Task.all
  end


  def create
    task = Task.create(safe_params)
    render json: task, status: 201
  end

  def update
    Task.find(params[:id]).update_attributes(safe_params)
    render nothing: true, status: 204
  end

  def destroy
    Task.find(params[:id]).destroy
    render nothing: true, status: 204
  end

  private

  def safe_params
    params.require(:task).permit(:description, :priority, :completed, :due_date)
  end

end
