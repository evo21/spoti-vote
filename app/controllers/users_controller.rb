class UsersController < ApplicationController
	
=begin
	
  def index
    if !params[:track_name].empty?
      @track_name = RSpotify::Track.search(params[:track_name])
    else
      render :index
    end
  end
=end

  def index
  	@suggestion = Suggestion.new
  	render :index
  end

  def show
  end
end
