class ActorsController < ApplicationController
  before_action :find, only:[:show, :edit, :update, :destroy]
  def index
    @actors = Actor.all
  end

  def new
    @actor = Actor.new
  end

  def show
  end

  def create
    @actor = Actor.new(actor_params)
    @actor.save
    redirect_to actor_path(@actor)
  end

  def edit
  end

  def update
    @actor.update(actor_params)
    @actor.save
    redirect_to actor_path(@actor)
  end

  def destroy
    @actor.delete
    redirect_to actors_path
  end

  private

  def find
    @actor = Actor.find(params[:id])
  end

  def actor_params
    params.require(:actor).permit(:name, :price, :field, :description)
  end
end
