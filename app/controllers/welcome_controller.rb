class WelcomeController < ApplicationController
  def index
  end

  def index
    @photos = Photo.all
  end

  def index
    @events = Event.all
  end

end