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
    respond_to do |format|
      if @reserve.save
        format.html { redirect_to @reserve, :notice => "Successfully created reserve." }
        format.js
      else
        format.html { render :action => 'new' }
        format.js
      end
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
    respond_to do |format|
      format.html { redirect_to reserves_url, :notice => "Successfully destroyed reserve." }
      format.js
    end
  end
end
