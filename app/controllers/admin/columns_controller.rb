module Admin
  class ColumnsController < Admin::ApplicationController
    def import
      begin
        ActiveRecord::Base.transaction do
          Column.import(params[:file])
        end
        flash[:success] = "コラムCSVファイルのインポートに成功しました。"
      rescue ActiveRecord::RecordInvalid => e
        flash[:alert] = e.message
      end
      redirect_to admin_columns_path
    end
  end
end
