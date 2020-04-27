class GraphsController < ApplicationController
  def index
    @graphs = user.graphs.order(date: "ASC")
  end
end
