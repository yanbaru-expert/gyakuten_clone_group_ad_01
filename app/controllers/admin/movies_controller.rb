module Admin
  class MoviesController < Admin::ApplicationController
    def import
      Movie.import(params[:file])

      if params[:file].original_filename == "movie_data.csv"
        flash[:success] = "動画CSVファイルの読み込みに成功しました。"
      else
        flash[:error] = "動画CSVファイルの読み込みに失敗しました。"
      end

      redirect_to admin_movies_path
    end
  end
end
