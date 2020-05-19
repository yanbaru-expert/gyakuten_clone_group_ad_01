module Admin
  class ColumnsController < Admin::ApplicationController
    def import
      Column.import(params[:file])
      flash[:success] = "コラムCSVファイルのインポートに成功しました。"
      redirect_to admin_columns_path
    end
  end
end
