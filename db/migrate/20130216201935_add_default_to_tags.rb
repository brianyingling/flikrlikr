class AddDefaultToTags < ActiveRecord::Migration
  def change
    change_column :tags, :num_likes, :integer, :default=>0
    change_column :tags, :num_dislikes, :integer, :default=>0
  end
end
