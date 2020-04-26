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
#  user_id     :integer          not null
#
# Indexes
#
#  index_graphs_on_user_id_and_date  (user_id,date) UNIQUE
#
class Graph < ApplicationRecord
  validates :user_id, presence: true
  validates :date, presence: true, uniqueness: { scope: :user_id }
  validates :temperature, presence: true
  validates :weight, presence: true
  validates :symptom, presence: true
end
