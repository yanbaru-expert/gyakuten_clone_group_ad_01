# == Schema Information
#
# Table name: columns
#
#  id         :bigint           not null, primary key
#  date       :string
#  detail     :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Column < ApplicationRecord
  validates :date, presence: true
  validates :title, presence: true
  validates :detail, presence: true
end
