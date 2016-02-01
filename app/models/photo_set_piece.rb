class PhotoSetPiece < ActiveRecord::Base

  has_many :images, :dependent => :delete_all
  has_and_belongs_to_many :collections
  has_attached_file :pic, :styles => { :medium => "600x450>", :thumb => "160x120>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :pic, :content_type => /\Aimage\/.*\Z/

  def price
    pieces = PhotoSetPiece.all.order(id: :asc).limit(self.id)
    set_pieces = pieces.where(:mode=>'single')
    sets = set_pieces.count/100
    return calculate_price(sets)
  end

  def calculate_price(sets)
    price = 100
    times = sets % 100

    times.times { price *= 1.5 }

    price
  end

  def owned
    return owner.present?
  end

end