class LocationController < ApplicationController
  skip_authorization_check 

  def cities
    @cities = City.for_region(params[:region_id]).select([:id, :name]).all
    render :_cities, layout: false
  end
  
end