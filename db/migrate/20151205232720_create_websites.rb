class CreateWebsites < ActiveRecord::Migration
  def change
    create_table :websites do |t|
      t.belongs_to :post
      t.belongs_to :user
      t.string :title
      t.text :description
      t.string :image_url
      t.string :url
      t.string :slug
    end
  end
end
