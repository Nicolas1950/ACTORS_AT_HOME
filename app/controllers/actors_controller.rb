class ActorsController < ApplicationController
  before_action :find, only:[:show, :edit, :update, :destroy]
  def index
    @actors = policy_scope(Actor)
    if params[:query].present?
      sql_query = "name ILIKE :query OR field ILIKE :query"
      @actors = Actor.where(sql_query, query: "%#{params[:query]}%")
    else
      @actors = Actor.all
    end

    @markers = @actors.geocoded.map do |actor|
      {
        lat: actor.latitude,
        lng: actor.longitude,
        info_window: render_to_string(partial: "info_window", locals: { actor: actor })
      }
    end
  end

  def new
    @actor = Actor.new
    authorize @actor
  end

  def show
    @booking = Booking.new
  end

  def create
    @actor = Actor.new(actor_params)
    @actor.user = current_user
    if @actor.save
      redirect_to actor_path(@actor)
    else
      render :new
    end
    authorize @actor
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
    authorize @actor
  end

  def actor_params
    params.require(:actor).permit(:name, :price, :field, :description, :photo)
  end
end
