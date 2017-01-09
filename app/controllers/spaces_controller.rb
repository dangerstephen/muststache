class SpacesController < ApplicationController
  before_action :space_id, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, expect: [:show]

  def index
    @spaces = current_user.spaces
  end

  def show
    @photos = @space.photos
  end

  def new
    @space = current_user.spaces.create
  end

  def create
    @space = current_user.spaces.create(spaces_params)

    if @space.save
      if params[:images]
        params[:images].each do |image|
          @space.photos.create(image: image)
        end
      end
      @photos = @space.photos
      redirect_to edit_space_path(@space), notice: "Saved!"
    else
      render :new
    end
  end

  def edit
    if current_user.id == @space.user.id
    @photo = @space.photos
  else
    redirect_to root_path, notice: "You dont have permission!"
  end

  def update
    if @space.update(spaces_params)
        if params[:images]
          params[:images].each do |image|
            @space.photos.create(image: image)
          end
        end

        redirect_to edit_space_path(@space), notice: "Updated!"
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def space_id
    @space = Space.find(params[:id])
  end

  def spaces_params
    params.require(:space).permit(:location, :size, :available, :space_type, :description, :price, :title)
  end

end
