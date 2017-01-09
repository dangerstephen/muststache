class SpacesController < ApplicationController
  before_action :space_id, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, expect: [:show]

  def index
    @spaces = current_user.spaces
  end

  def show
  end

  def new
    @space = current_user.spaces.create
  end

  def create
    @space = current_user.spaces.create(spaces_params)

    if @space.save
      redirect_to @space, notice: "Saved!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @space.save
      redirect_to @space, notice: "Updated!"
    else
      render :update
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
