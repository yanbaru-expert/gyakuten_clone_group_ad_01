class GraphsController < ApplicationController
  def index
    gon.records = Graph.chart_data(current_user)
  end
end
