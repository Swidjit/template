class AddPaperclipToPhotoPieceSets < ActiveRecord::Migration
  def self.up
    add_attachment :photo_set_pieces, :pic
  end

  def self.down
    remove_attachment :photo_set_pieces, :pic
  end
end
