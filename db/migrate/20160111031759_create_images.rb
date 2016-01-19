class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.belongs_to :photo_set_piece
      t.integer :order
    end
  end
end
