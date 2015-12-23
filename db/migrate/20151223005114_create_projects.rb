class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.string :description
      t.string :url
      t.datetime :start_date
      t.datetime :end_date
      t.string :slug
      t.integer :order
    end
  end
end
