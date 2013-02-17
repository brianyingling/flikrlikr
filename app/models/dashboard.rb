# == Schema Information
#
# Table name: dashboards
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Dashboard < ActiveRecord::Base
  attr_accessible :name
  has_many :searches
end
