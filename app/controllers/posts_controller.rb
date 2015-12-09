class PostsController < ApplicationController
  respond_to :js

  def show
    @item = Post.find_by_slug(params[:id])
    @comments = @item.comment_threads.order('created_at desc')
    @new_comment = Comment.build_from(@item, current_user.id, "") if user_signed_in?
    authorize! :read, @item

  end

  def create
    if user_signed_in?
      @post = Post.create(post_params)
      current_user.posts << @post

      redirect_to post_path(@post.slug)
    end
  end


  def index
    @posts = Post.order(created_at: :desc)
    if params.has_key?(:tag)
      @posts=@posts.tagged_with(params[:tag])
    end
    if params.has_key?(:cat)
      @posts=@posts.where(:category_id=>params[:cat])
    end

    @total_pages = (@posts.length / 15) + 1

    posts = @posts.pluck(:id)
    if params.has_key?(:page)  && params[:page].to_i > 0
      offset = (params[:page].to_i-1) * 15
      ids = posts[offset..offset+14]
      @posts = Post.find(ids)
      render :partial => @posts
    else

      offset = 0
      ids = posts[offset..offset+14]
      @posts = Post.find(ids)
    end
  end


  def destroy
    @post = Post.find(params[:id])
    @id=@post.id
    if @post.destroy
      respond_with do |format|
        format.js {render 'destroy', :locals=>{id:@id}}
      end
    end
  end

  def autocomplete_tag_search
    @tags = ActsAsTaggableOn::Tag.where("name LIKE (?)","%#{params[:q]}%")
    respond_to do |format|
      format.json { render :json => @tags.collect{|tag| {:id => tag.name, :name => tag.name}} }
    end
  end

  def create_or_destroy_reaction
    @model = params[:model]
    if @model == 'Post'
      @item = Post.find(params[:id])
      @model = 'post-'+@item.id.to_s
      importance = 1
    else
      @att = @model.constantize.find(params[:id])
      @item = @att.post
      @model = params[:model].downcase+'-'+@att.id.to_s
      importance = 0.3
    end
    cancelled = false
    @reaction = Reaction.where(:reactable_type => params[:model], :reactable_id => params[:id], :user_id => current_user.id, :reaction_type => params[:type]).first
    if @reaction.present?
      Reaction.destroy(@reaction.id)
      cancelled = true
    else
      @reaction = Reaction.create!(:reactable_type => params[:model], :reactable_id => params[:id], :user_id => current_user.id, :reaction_type => params[:type])
    end
    case params[:type]
      when 'like'
        if cancelled
          @item.update_attribute(:importance, @item.importance-importance)
        else
          @item.update_attribute(:importance, @item.importance+importance)
        end
        if @att.present?

          @count = @att.reactions.liked.size
        else

          @count = @item.reactions.liked.size
        end

        @class = "like"
        render 'reactions/liked'
      when 'love'
        if cancelled
          @item.update_attribute(:importance, @item.importance-(importance*3))
        else
          @item.update_attribute(:importance, @item.importance+(importance*3))
        end
        if @att.present?
          @count = @att.reactions.loved.size
        else
          @count = @item.reactions.loved.size
        end
        @class = "love"
        render 'reactions/liked'
      when 'share'
        if cancelled
          @item.update_attribute(:importance, @item.importance-(importance*5))
        else
          @item.update_attribute(:importance, @item.importance+(importance*5))
        end
        if @att.present?
          @count = @att.reactions.shared.size
        else
          @count = @item.reactions.shared.size
        end
        @class = "share"
        render 'reactions/liked'

    end
  end
  def scrape_url_for

    if params[:url].include?('?')
      @clean_url = params[:url].split('?').first
    else
      @clean_url = params[:url]
    end
    @page = MetaInspector.new(params[:url],
                              :warn_level => :store,
                              :connection_timeout => 5, :read_timeout => 5,
                              :headers => { 'User-Agent' => user_agent, 'Accept-Encoding' => 'identity' })
    @url=params[:url]
    if params[:url] =~ /^(?:https?:\/\/)?(?:www\.)?youtu(?:\.be|be\.com)\/(?:watch\?v=)?([\w-]{10,})/
      @video_url = params[:url]
      @video_id = params[:url].split('/')[-1].split('=')[-1]
      if @video_url =~ /^(?:https?:\/\/)?(?:www\.)?youtu(?:\.be|be\.com)\/(?:watch\?v=)?([\w-]{10,})/
        @video_type = "youtube"
      elsif @video_url.include? 'vimeo'
        @video_type = 'vimeo'
      elsif @video_url.include? 'vine.co'
        @video_type = 'vine'
      end
      render '/posts/video_scrape'
    elsif ['gif','jpg','jpeg','png'].include?(@clean_url.split('.').last)
      @image_url = @clean_url
      render '/posts/image_scrape'
    elsif params[:url]


      if @page.response.nil?
        render :nothing => :true
      else
        render '/posts/link_scrape'
      end
    else

      render 'scrapes/scrape_failed'
    end
  end

  private
  def user_agent
    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36"
  end
  def post_params
    params.require(:post).permit(:user_id, :category_id,:title,:body, :tag_list, websites_attributes: [:title, :url, :description, :image_url],url_images_attributes: [:url,:title, :description], url_videos_attributes: [:title, :url, :description, :video_id, :video_source])
  end
end
