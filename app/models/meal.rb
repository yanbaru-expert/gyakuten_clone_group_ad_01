# == Schema Information
#
# Table name: meals
#
#  id         :bigint           not null, primary key
#  content    :text             not null
#  image      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Meal < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :content, presence: true, length: { maximum: 140 }
end
