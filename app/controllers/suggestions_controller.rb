class SuggestionsController < ApplicationController
  before_action :set_suggestions

  def index
    @suggestion = Suggestion.new
    if params[:query]
      @result = RSpotify::Track.search(params[:query])
    end
      render :index
  end

  def create
    track = RSpotify::Track.find(params[:track_id])
    artists = ""
    if track.artists.length != 1
      track.artists.each do |x|
        artists = artists + x.name + ", "
      end
      artists = artists[0..-3]
    else
      artists = track.artists[0].name
    end
    
    Suggestion.create(:artist => artists, :track_name => track.name, 
                      :album => track.album.name, :user_id => current_user.id,
                      :spotify_id => track.id, :artwork => track.album.images[0]['url'],
                      :is_explicit => track.explicit)
    
    redirect_to suggestions_path
  end

  def upvote
    if current_user.votes > 0
      @suggestion = Suggestion.find(params[:id])
      Upvote.create(suggestion_id: @suggestion.id, user_id: current_user.id)
      @user = current_user
      @user.votes -= 1
      @user.save
    else
      flash[:notice] = "You have no more votes"
    end
    render :index
  end

  def downvote
    if current_user.votes > 0
      @suggestion = Suggestion.find(params[:id])
      Downvote.create(suggestion_id: @suggestion.id, user_id: current_user.id)
      @user = current_user
      @user.votes -= 1
      @user.save
    else
      flash[:notice] = "You have no more votes"
    end
    render :index
  end

  def show
  	@track = RSpotify::Track.find(params[:id])
  	render :index
  end

  private

    def set_suggestions
      @suggestions = Suggestion.all
    end

end