class Collection < ActiveRecord::Base
  has_and_belongs_to_many :photo_set_pieces
end