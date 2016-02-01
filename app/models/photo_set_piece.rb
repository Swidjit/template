class PhotoSetPiece < ActiveRecord::Base

  has_many :images, :dependent => :delete_all
  has_and_belongs_to_many :collections
  has_attached_file :pic, :styles => { :medium => "600x450>", :thumb => "160x120>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :pic, :content_type => /\Aimage\/.*\Z/

end