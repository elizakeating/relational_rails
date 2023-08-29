class OrchestraMusiciansController < ApplicationController
  def index
    @orchestra = Orchestra.find(params[:id])
    @musicians = @orchestra.sort(params)
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