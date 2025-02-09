class EventsController < ApplicationController
  before_action :set_user, only: [:new, :edit, :create, :index]
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to @event, notice: "イベントが作成されました。"
    else
      render :new
    end
  end

  def edit
    respond_to do |format|
      format.html
      format.turbo_stream { render partial: "form", locals: { event: @event } }
    end
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to @event, notice: "イベントが更新されました。"
    else
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_url, notice: "イベントが削除されました。"
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :start_time, :end_time, :user_id)
  end

  def set_user
    @users = User.all
  end

  def set_event
    @event = Event.find(params[:id])
  end
end