namespace :init do

  task :add_tags => :environment do
    ActsAsTaggableOn::Tag.create(:name => "neuroscience")
    ActsAsTaggableOn::Tag.create(:name => "puzzles")
    ActsAsTaggableOn::Tag.create(:name => "brain-teasers")
    ActsAsTaggableOn::Tag.create(:name => "research")
    ActsAsTaggableOn::Tag.create(:name => "brain-fitness")
    ActsAsTaggableOn::Tag.create(:name => "iq-tests")
    ActsAsTaggableOn::Tag.create(:name => "optical-illusions")
    ActsAsTaggableOn::Tag.create(:name => "memory")
    ActsAsTaggableOn::Tag.create(:name => "executive-function")
    ActsAsTaggableOn::Tag.create(:name => "problem-solving")
    ActsAsTaggableOn::Tag.create(:name => "attention")
    ActsAsTaggableOn::Tag.create(:name => "task-swtiching")
    ActsAsTaggableOn::Tag.create(:name => "multi-tasking")
    ActsAsTaggableOn::Tag.create(:name => "language")
    ActsAsTaggableOn::Tag.create(:name => "spatial-processing")
    ActsAsTaggableOn::Tag.create(:name => "reaction-speed")
    ActsAsTaggableOn::Tag.create(:name => "sensory-perception")
    ActsAsTaggableOn::Tag.create(:name => "pattern-recognition")
    ActsAsTaggableOn::Tag.create(:name => "blogs")
    ActsAsTaggableOn::Tag.create(:name => "games")
    ActsAsTaggableOn::Tag.create(:name => "articles")
    ActsAsTaggableOn::Tag.create(:name => "psychology")
    ActsAsTaggableOn::Tag.create(:name => "neuroplasticity")
  end

  task :seed_projects => :environment do
    Project.delete_all
    Project.create(:title=>'Presidential Election Games', :description => 'A hub of discovery and fun for the 2016 presidential election. Fantasy games, candidate articles, debate headquarters, polls, memes, comedy and more.', :start_date => '', :end_date => '', :url => 'http://www.presidentialelectiongames.com', :slug => 'presidential-election-games', :order => 1)
    #Project.create(:title=>'Abstract Photography', :description => 'Crazy colorscapes using frost and ice to distort light.', :start_date => '', :end_date => '', :url => 'https://www.etsy.com/shop/playwithyourmind', :slug => 'abstract-photography', :order => 4)
    #Project.create(:title=>'Witzi', :description => 'Crowd competitions of wit, creativity and imagination', :start_date => '', :end_date => '', :url => 'http://witzi.herokuapp.com', :slug => 'witzi', :order => 2)
    #Project.create(:title=>'Jammies', :description => 'A Spotify-like service using music from all the live shows on archive.org.', :start_date => '', :end_date => '', :url => 'http://jammies.herokuapp.com', :slug => 'jammies', :order => 3)
    #Project.create(:title=>'Kitchen Swingers', :description => 'A web app to help you turn your home into a restaurant and earn credits for meals you serve to others.', :start_date => '', :end_date => '', :url => 'http://kitchen-swingers.herokuapp.com', :slug => 'kitchen-swingers', :order => 5)
    #Project.create(:title=>'Good Luck', :description => '', :start_date => '', :end_date => '', :url => 'http://www.goodlucktest.com', :slug => 'good-luck', :order => 6)
    #Project.create(:title=>'PlayWithYourMind', :description => '', :start_date => '', :end_date => '', :url => 'http://playwithyourmind.com', :slug => 'play-with-your-mind', :order => 7)
    #Project.create(:title=>'Ripples', :description => '', :start_date => '', :end_date => '', :url => 'http://ripplz.herokuapp.com', :slug => 'ripples', :order => 9)
    #Project.create(:title=>'South Meadow Urban Oasis', :description => 'Urban homestead, bed&breakfast and seasonal farmstand', :start_date => '', :end_date => '', :url => '', :slug => 'south-meadow-urban-oasis', :order => 10)
    #Project.create(:title=>'Permaculture', :description => '', :start_date => 'Edible landscaping, permaculture and ecosystem design', :end_date => '', :url => '', :slug => 'permaculture', :order => 8)
  end


  task :seed_categories => :environment do
    Category.create(:title=>'Climate Justice',:description=>'Climate Justice',:slug=>'climate-justice')
    Category.create(:title=>'Social Justice',:description=>'Social Justice',:slug=>'social-justice')
    Category.create(:title=>'Gender Equality',:description=>'Gender Equality',:slug=>'gender-equality')
  end

end