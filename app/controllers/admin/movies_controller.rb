module Admin
  class MoviesController < Admin::ApplicationController
    def import
      Movie.import(params[:file])
      flash[:success] = "動画CSVファイルのインポートに成功しました。"
      redirect_to admin_movies_path
    end
  end
end
