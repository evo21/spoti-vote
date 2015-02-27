class SuggestionsController < ApplicationController
  before_action :set_suggestions

  def index
    @suggestion = Suggestion.new
    # if !params[:track_name].empty?
    #   @track_name = RSpotify::Track.search(params[:track_name])
    # else
      render :index
    # end
  end

  def search_spotify
    # @suggestion = Suggestion.create(song_params)
    if params[:query]
      @result = RSpotify::Track.search(params[:query])
    end
    render :index
  end

  def add_suggestion
    # @suggestion = Suggestion.create(whatever params)
  end

  def show
  	@track = RSpotify::Track.find(params[:id])
  	render :index
  end

  def add
    track = RSpotify::Track.find(params[:track])
    # binding.pry
    artists = ""
    if track.artists.length != 1
      track.artists.each do |x|
        artists = artists + x.name + ", "
      end
      artists = artists[0..-3]
    else
      artists = track.artists[0].name
    end
    t = Suggestion.new(:artist => artists, :track_name => track.name, 
                      :album => track.album.name, :user_id => current_user.id,
                      :spotify_id => track.id, :artwork => track.album.images[0]['url'],
                      :is_explicit => track.explicit)
    @suggestions = Suggestion.all
    t.save
    render :index
  end

  private

    def set_suggestions
      @suggestions = Suggestion.all
    end

end