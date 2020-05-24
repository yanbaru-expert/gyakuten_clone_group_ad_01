module Admin
  class MoviesController < Admin::ApplicationController
    def import
      begin
        ActiveRecord::Base.transaction do
          Movie.import(params[:file])
        end
        flash[:success] = "動画CSVファイルのインポートに成功しました。"
      rescue ActiveRecord::RecordInvalid => e
        flash[:alert] = e.message
      end
      redirect_to admin_movies_path
    end
  end
end
