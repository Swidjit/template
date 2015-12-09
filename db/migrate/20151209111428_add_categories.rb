class AddCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :title
      t.text :description
      t.string :slug
      t.text :hashtags, :array=>:true
    end
  end
end
