# == Schema Information
#
# Table name: photos
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  url        :text
#  status     :string(255)
#  comment    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Photo < ActiveRecord::Base
  attr_accessible :title, :url, :status, :search_id
  has_and_belongs_to_many :tags
  belongs_to :search
end
