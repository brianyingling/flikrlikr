class CreateTagsTable < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string        :text
      t.integer       :count
      t.integer       :num_likes
      t.integer       :num_dislikes
      t.integer       :num_neutral
      t.timestamps
    end
  end
end
