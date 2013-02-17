# == Schema Information
#
# Table name: searches
#
#  id                :integer          not null, primary key
#  text              :string(255)
#  num_likes         :integer
#  num_dislikes      :integer
#  num_neutral       :integer
#  num_photos_viewed :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Search < ActiveRecord::Base
  attr_accessible :text, :random?, :num_likes, :num_dislikes, :num_neutral
  has_many :photos
end
