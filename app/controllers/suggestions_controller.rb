class SuggestionsController < ApplicationController
  def index
  	if !params[:track_name].empty?
  	  @track_name = RSpotify::Track.search(params[:track_name]).name
  	else
  	  render :index
    end
  end

  def show
  	@track = RSpotify::Track.find(params[:id])
  	render :index
  end
end



# user searches => rails gets all results from that search

# in the partial
# results.each |result|