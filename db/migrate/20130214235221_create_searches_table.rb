class CreateSearchesTable < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string        :text
      t.integer       :num_likes
      t.integer       :num_dislikes
      t.integer       :num_neutral
      t.integer       :num_photos_viewed
      t.timestamps
    end
  end
end
