class CreatePhotosTable < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string      :title
      t.text        :url
      t.string      :status
      t.text        :comment
      t.timestamps
    end
  end
end
