class PhotoSetPiecesController < ApplicationController
  respond_to :js

  def show
    @piece = PhotoSetPiece.find(params[:id])
    #@comments = @item.comment_threads.order('created_at desc')
    #@new_comment = Comment.build_from(@item, current_user.id, "") if user_signed_in?


  end

  def create
    count = PhotoSetPiece.all.count
    level = count/100 + 1
    @piece = PhotoSetPiece.create(:level=>level, :image_date => params[:photo_set_piece][:image_date],:shop_urls => params[:photo_set_piece][:shop_urls])
    params[:photo_set_piece][:collections].split(',').each do |col|
      puts col
      Collection.find(col).photo_set_pieces << @piece
    end
    render 'add_photo'
  end

  def upload_file
    @piece = PhotoSetPiece.unscoped.where(:id=>params[:id]).first
    @piece.pic = URI.parse(URI.unescape(params['url']))
    @piece.save
    redirect_to @piece
  end

  def index
    @pieces = PhotoSetPiece.all
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

end
