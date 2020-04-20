# == Schema Information
#
# Table name: solitudes
#
#  id         :bigint           not null, primary key
#  content    :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Solitude < ApplicationRecord
end
