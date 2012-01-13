class ReservesController < ApplicationController
  def index
    @reserves = Reserve.all
  end

  def show
    @reserve = Reserve.find(params[:id])
  end

  def new
    @reserve = Reserve.new
  end

  def create
    @reserve = Reserve.new(params[:reserve])
    if @reserve.save
      redirect_to @reserve, :notice => "Successfully created reserve."
    else
      render :action => 'new'
    end
  end

  def edit
    @reserve = Reserve.find(params[:id])
  end

  def update
    @reserve = Reserve.find(params[:id])
    if @reserve.update_attributes(params[:reserve])
      redirect_to @reserve, :notice  => "Successfully updated reserve."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @reserve = Reserve.find(params[:id])
    @reserve.destroy
    redirect_to reserves_url, :notice => "Successfully destroyed reserve."
  end
end
