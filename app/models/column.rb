# == Schema Information
#
# Table name: columns
#
#  id         :bigint           not null, primary key
#  date       :string           not null
#  detail     :string           not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Column < ApplicationRecord
  validates :date, presence: true
  validates :title, presence: true
  validates :detail, presence: true

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      # IDが見つかれば、レコードを呼び出し、見つかれなければ、新しく作成
      column = find_by(id: row["id"]) || new
      # CSVからデータを取得し、設定する
      column.attributes = row.to_hash.slice(*updatable_attributes)
      # 保存する
      column.save
    end
  end

  # 更新を許可するカラムを定義
  def self.updatable_attributes
    %w[id date title detail]
  end
end
