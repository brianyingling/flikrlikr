# == Schema Information
#
# Table name: tags
#
#  id           :integer          not null, primary key
#  text         :string(255)
#  count        :integer
#  num_likes    :integer
#  num_dislikes :integer
#  num_neutral  :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Tag < ActiveRecord::Base
  attr_accessible :text, :count, :num_likes, :num_dislikes, :num_neutral
  has_and_belongs_to_many :photos
end
