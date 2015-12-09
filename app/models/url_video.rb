class UrlVideo < ActiveRecord::Base
  has_many :reactions, as: :reactable
  belongs_to :post
end