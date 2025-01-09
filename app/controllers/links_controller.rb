class LinksController < ApplicationController

  def index
    @links = Link.recent_first
  end

  def show
    @link = Link.find(params[:id])
  end
  def new
    @link = Link.new
  end
  def create
    @link = Link.new(link_params)
    if @link.save
      redirect_to @link
    else
      render :new , status: :unprocessable_entity
    end
  end
  def edit
    @link = Link.find(params[:id])
  end
  def update
    @link = Link.find(params[:id])
    if @link.update(link_params)
      redirect_to @link
    else
      render :edit, status: :unprocessable_entity
    end
  end
  def destroy
    @link = Link.find(params[:id])
    @link.destroy
    redirect_to links_path
  end

  private
  def link_params
    params.require(:link).permit(:url, :title, :description, :image)
  end
end
