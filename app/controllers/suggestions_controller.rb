class SuggestionsController < ApplicationController

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
    @result = RSpotify::Track.search(params[:query])
    render :show
  end

  def add_suggestion
    # @suggestion = Suggestion.create(whatever params)
  end

  def show
  	@track = RSpotify::Track.find(params[:id])
  	render :index
  end

  # def search_spotify
  #   params[:track_name].empty?
  #   binding.pry
  #     @track_name = RSpotify::Track.search(params[:track_name]).name
  #   render :index
  # end


  private
    # def song_params
    #   params.require(:suggestion).permit(:artist, :track_name, :album, :spotify_id, :artwork, :is_explicit)
    # end

end
# user searches => rails gets all results from that search

# in the partial
# results.each |result|