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
end
