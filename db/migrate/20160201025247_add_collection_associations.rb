class AddCollectionAssociations < ActiveRecord::Migration
  def change
    create_table :collections_photo_set_pieces, id: false do |t|
      t.belongs_to :collection, index: true
      t.belongs_to :photo_set_piece, index: true
    end
  end
end
