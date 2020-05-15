class SolitudesController < ApplicationController
  def index
    @solitudes = Solitude.all
  end

  def create
    @solitude = Solitude.create!(solitude_params)
  end

  private

  def solitude_params
    params.require(:solitude).permit(:content)
  end
end
