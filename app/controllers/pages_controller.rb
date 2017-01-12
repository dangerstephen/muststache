class PagesController < ApplicationController
  def home
    @all_photos = Photo.all
    render ('photos/index')
  end
end
