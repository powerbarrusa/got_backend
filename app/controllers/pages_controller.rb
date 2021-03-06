class PagesController < ApplicationController

  def index
    resource = params["name"].downcase;

    found = Region.where("LOWER(name) like ? ", "%#{resource}%")

    if (found)
      @regions = found.first
      render json: @regions, include: 'images'
    else
      render json: {}
    end

  end

end
