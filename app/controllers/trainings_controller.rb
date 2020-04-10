class TrainingsController < ApplicationController

  def index
    @trainings = Training.all
  end

  def new
    @training = Training.new
  end

  def create
    Training.create(training_params)
    redirect_to :action => :index
  end

  private

  def training_params
    params.require(:training).permit(:image,:content)
  end

end
