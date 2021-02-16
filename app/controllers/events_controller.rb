class EventsController < ApplicationController

  before_action :authenticate_user, except: [:index, :show]

  def index
    @event = Event.all
    if current_user != nil
      @name = current_user.first_name
    end

  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(post_params)
    @event.admin = current_user
    if @event.save
      redirect_to event_path(@event.id)
    else
      puts "$" * 30
      puts "error message"
      puts "$" * 30
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def authenticate_user
    unless current_user
      flash[:danger] = "Il faut s'enregistrer bb"
      redirect_to new_user_session_path
    end
  end

  def post_params
    post_params = params.require(:event).permit(:title, :location, :description, :start_date, :price, :duration)
  end

end
