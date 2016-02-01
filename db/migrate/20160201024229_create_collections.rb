class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.string :name
      t.string :description
      t.text :about
      t.integer :count, :default => 0
    end
  end
end
