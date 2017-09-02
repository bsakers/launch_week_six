class CampersController < ApplicationController

  def index
    if params[:campsite_id] == nil
      @title = "All Campers:"
      @campers= Camper.all
    else
      @campsite= Campsite.find(params[:campsite_id])
      @title = "Campers bunking in #{@campsite.name}"
      @campers = @campsite.campers
    end
  end
end
