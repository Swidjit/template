class Post < ActiveRecord::Base

  belongs_to :user

  has_many :reactions, as: :reactable,dependent: :destroy
  has_many :websites,dependent: :destroy
  has_many :url_images,dependent: :destroy
  has_many :url_videos,dependent: :destroy

  accepts_nested_attributes_for :websites,:url_videos, :url_images

  acts_as_commentable
  acts_as_taggable

  after_create :add_title_and_slug



  def add_title_and_slug
    if self.title.length == 0
      self.title = self.body.gsub(/(?:http|https):\/\/[a-z0-9]+(?:[\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(?:(?::[0-9]{1,5})?\/[^\s]*)?/ix,'').truncate(30, :separator => ' ',omission: '').gsub(/[^a-z0-9\s]/i, '')
      self.title = "Untitled "+ self.id.to_s if self.title == ""

    end
    self.title=self.title.chomp(' ') if self.title[-1,1]
    self.slug =(self.title.gsub(' ','-') + '-'+self.id.to_s)
    self.save
  end

end