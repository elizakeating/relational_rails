class OrchestraMusiciansController < ApplicationController
  def index
    @orchestra = Orchestra.find(params[:id])
    if params[:sort] == "name"
      @musicians = @orchestra.musicians.order(:name)
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
end