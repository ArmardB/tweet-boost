class SearchController < ApplicationController
  def index
    #Set number of tweets to be displayed on initial search
    # if params[:increment]
    #   @display = 10
    #   @display = params[:increment].to_i
    # else
    #   @display = 10
    # end

    
    if params[:search] and params[:search] != "" and current_user
      @results = current_user.twitter.search(params[:search], :count => @display, :lang => 'en')
    elsif params[:search] and params[:search] != ""
      @results = application.search(params[:search], :count => @display, :lang => 'en')
    end

    # Respond to AJAX javascript calls
    respond_to do |format|
      format.html
      format.js
    end
  end

end

