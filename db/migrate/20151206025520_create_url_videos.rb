class CreateUrlVideos < ActiveRecord::Migration
  def change
    create_table :url_videos do |t|
      t.belongs_to :post
      t.belongs_to :user
      t.string :title
      t.text :description
      t.string :video_source
      t.string :video_id
      t.string :url
      t.string :slug
    end
  end
end
