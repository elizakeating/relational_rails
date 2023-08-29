class OrchestrasController < ApplicationController
  def index
    @orchestras = Orchestra.descending_created_at
  end

  def show
    @orchestra = Orchestra.find(params[:id])
  end

  def new
  end

  def create
    orchestra = Orchestra.new({
      name: params[:name],
      auditions_open: params[:auditions_open],
      year_established: params[:year_established]
    })

    orchestra.save

    redirect_to "/orchestras"
  end

  def edit
    @orchestra = Orchestra.find(params[:id])
  end

  def update
    orchestra = Orchestra.find(params[:id])
    orchestra.update({
      name: params[:name],
      auditions_open: params[:auditions_open],
      year_established: params[:year_established]
    })
    orchestra.save
    
    redirect_to "/orchestras/#{orchestra.id}"
  end

  def destroy
    orchestra = Orchestra.find(params[:id])
    orchestra.musicians.destroy_all
    orchestra.destroy
    redirect_to "/orchestras"
  end
end