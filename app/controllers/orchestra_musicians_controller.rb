class OrchestraMusiciansController < ApplicationController
  def index
    # binding.pry
    @orchestra = Orchestra.find(params[:id])
    if params[:sort] == "name"
      @musicians = @orchestra.musicians.order(:name)
    elsif params[:sort] == "threshold"
      @musicians = @orchestra.musicians.where("years_involved > 10")
    else
      @musicians = @orchestra.musicians
    end
  end

  def new
    @orchestra = Orchestra.find(params[:id])
  end

  def create
    orchestra = Orchestra.find(params[:id])
    orchestra_musician = orchestra.musicians.create!({
      name: params[:name],
      full_time: params[:full_time],
      years_involved: params[:years_involved]
    })

    orchestra_musician.save

    redirect_to "/orchestras/#{orchestra.id}/musicians"
  end

  def threshold
    @orchestra = Orchestra.find(params[:id])
  end
end