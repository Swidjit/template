class AddImageUrls < ActiveRecord::Migration
  def change
    create_table :url_images do |t|
      t.belongs_to :post
      t.belongs_to :user
      t.string :title
      t.text :description
      t.string :image_source
      t.string :url
      t.string :slug
    end
  end
end
