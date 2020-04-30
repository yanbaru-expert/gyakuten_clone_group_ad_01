# == Schema Information
#
# Table name: graphs
#
#  id          :bigint           not null, primary key
#  date        :date             not null
#  other       :text
#  symptom     :integer          not null
#  temperature :decimal(4, 2)    not null
#  weight      :decimal(4, 1)    not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_graphs_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Graph < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :date, presence: true, uniqueness: { scope: :user_id }
  validates :temperature, presence: true
  validates :weight, presence: true
  validates :symptom, presence: true

  # そのままデータを取り出すと，日付が不連続なデータになるため，日付の連続したデータを作成する。
  def self.chart_data(user)
    graphs = user.graphs.order(date: :asc)

    # 記録が無い場合にエラーが出るのを防止
    return [{ date: Time.zone.today, temperature: nil, weight: nil, symptom: nil, other: nil }] if graphs.empty?

    period = graphs[0].date..graphs[-1].date
    # 記録の初日から最終日までの配列データを作成
    index = 0
    period.map do |date|
      if graphs[index].date == date
        temperature = graphs[index].temperature
        weight = graphs[index].weight
        symptom = graphs[index].symptom
        other = graphs[index].other
        index += 1
      end
      # データが存在しない日付の体重は nil とする。
      { date: date, temperature: temperature, weight: weight, symptom: symptom, other: other }
    end
  end
end
