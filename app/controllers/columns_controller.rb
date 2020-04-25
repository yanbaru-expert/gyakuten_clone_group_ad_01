class ColumnsController < ApplicationController
  def index
    @columns = Column.all.order(id: "DESC").page(params[:page]).per(5)
  end
end
