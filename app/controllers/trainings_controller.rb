class TrainingsController < ApplicationController
  def index
    @trainings = Training.all.order(created_at: :desc)
  end

  def new
    @training = Training.new
  end

  def create
    Training.create(training_params)
    redirect_to action: :index
  end

  def edit
    @training = Training.find(params[:id])
  end

  def update
    training = Training.find(params[:id])
    training.update(training_params)
    redirect_to action: :index
  end

  def destroy
    training = Training.find(params[:id])
    training.destroy
    redirect_to action: :index
  end

  private

  def training_params
    params.require(:training).permit(:image, :content)
  end
end
