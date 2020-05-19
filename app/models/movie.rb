# == Schema Information
#
# Table name: movies
#
#  id         :bigint           not null, primary key
#  title      :string
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Movie < ApplicationRecord
  validates :title, presence: true
  validates :url, presence: true

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      # IDが見つかれば、レコードを呼び出し、見つかれなければ、新しく作成
      movie = find_by(id: row["id"]) || new
      # CSVからデータを取得し、設定する
      movie.attributes = row.to_hash.slice(*updatable_attributes)
      # 保存する
      movie.save!
    end
  end

  # 更新を許可するカラムを定義
  def self.updatable_attributes
    %w[id title url]
  end
end
