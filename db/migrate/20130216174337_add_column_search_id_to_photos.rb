class AddColumnSearchIdToPhotos < ActiveRecord::Migration
  def change
    #adds a search ID column to the photos table
    add_column :photos, :search_id, :integer
  end
end
