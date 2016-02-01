class CreatePhotoSetPieces < ActiveRecord::Migration
  def change
    create_table :photo_set_pieces do |t|
      t.string :title, :default => 'Untitled'
      t.integer :level, :default => 1
      t.string :mode, :default => 'single'
      t.belongs_to :photo_set_series
      t.text :shop_urls, :array=>:true
      t.datetime :image_date
      t.string :owner
      t.string :owner_comment
      t.timestamps
    end
  end
end
