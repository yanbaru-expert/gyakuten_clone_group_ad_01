# == Schema Information
#
# Table name: graphs
#
#  id          :bigint           not null, primary key
#  date        :date             not null
#  other       :text
#  symptom     :integer          not null
#  temperature :decimal(4, 2)    not null
#  userid      :integer          not null
#  weight      :decimal(4, 1)    not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Graph < ApplicationRecord
  validates :userid, presence: true
  validates :date, presence: true
  validates :temperature, presence: true
  validates :weight, presence: true
  validates :symptom, presence: true
end
