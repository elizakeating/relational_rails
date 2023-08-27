class OrchestraMusiciansController < ApplicationController
  def index
    @orchestra = Orchestra.find(params[:id])
    @musicians = @orchestra.musicians
  end

  def new
    @orchestra = Orchestra.find(params[:id])
  end
end