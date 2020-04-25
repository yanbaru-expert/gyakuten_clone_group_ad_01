class GraphsController < ApplicationController
  def index
    @graphs = Graph.all.order(date: "ASC")
  end
end
