class Image < ActiveRecord::Base

  belongs_to :photo_set_piece
  has_attached_file :pic, :styles => { :medium => "960x720>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :pic, :content_type => /\Aimage\/.*\Z/

end
