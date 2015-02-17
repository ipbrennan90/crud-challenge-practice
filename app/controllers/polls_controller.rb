class PollsController < ApplicationController
  before_action :set_poll, only: [:show, :edit, :update, :destroy]

  def index
    @polls=Poll.all
  end

  def new
    @poll=Poll.new
  end

  def create
    @poll=Poll.new(poll_params)
    if @poll.save
      flash[:success] = "Poll recorded"
      redirect_to polls_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @poll.update(poll_params)
      flash[:success] = "Poll Updated"
      redirect_to poll_path(@poll)
    else
      render :edit
    end
  end

  def destroy
    @poll.destroy
    redirect_to polls_path
  end

  private

  def set_poll
    @poll=Poll.find(params[:id])
  end

  def poll_params
    params.require(:poll).permit(:subject, :date, :location, :total_polled)
  end
end
