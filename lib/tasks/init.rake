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
    #Project.create(:title=>'', :description => '', :start_date => '', :end_date => '', :url => '', :slug => '', :order => 1)
    #Project.create(:title=>'', :description => '', :start_date => '', :end_date => '', :url => '', :slug => '', :order => 1)
    #Project.create(:title=>'', :description => '', :start_date => '', :end_date => '', :url => '', :slug => '', :order => 1)
    #Project.create(:title=>'', :description => '', :start_date => '', :end_date => '', :url => '', :slug => '', :order => 1)
    #Project.create(:title=>'', :description => '', :start_date => '', :end_date => '', :url => '', :slug => '', :order => 1)
    #Project.create(:title=>'', :description => '', :start_date => '', :end_date => '', :url => '', :slug => '', :order => 1)
    #Project.create(:title=>'', :description => '', :start_date => '', :end_date => '', :url => '', :slug => '', :order => 1)
    #Project.create(:title=>'', :description => '', :start_date => '', :end_date => '', :url => '', :slug => '', :order => 1)
    #Project.create(:title=>'', :description => '', :start_date => '', :end_date => '', :url => '', :slug => '', :order => 1)
  end


  task :seed_categories => :environment do
    Category.create(:title=>'Climate Justice',:description=>'Climate Justice',:slug=>'climate-justice')
    Category.create(:title=>'Social Justice',:description=>'Social Justice',:slug=>'social-justice')
    Category.create(:title=>'Gender Equality',:description=>'Gender Equality',:slug=>'gender-equality')
  end

end