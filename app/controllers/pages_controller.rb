class PagesController < ApplicationController
  def home
    @all_photos = Photo.all
    @spaces = Space.all
    render ('photos/index')

  end
end
