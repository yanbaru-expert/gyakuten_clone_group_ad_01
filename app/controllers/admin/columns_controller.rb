module Admin
  class ColumnsController < Admin::ApplicationController
    def import
      Column.import(params[:file])

      if params[:file].original_filename == "column_data.csv"
        flash[:success] = "コラムCSVファイルの読み込みに成功しました。"
      else
        flash[:error] = "コラムCSVファイルの読み込みに失敗しました。"
      end

      redirect_to admin_columns_path
    end
  end
end
