class OrchestrasController < ApplicationController
  def index
    @orchestras = Orchestra.all.order(created_at: :desc)
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
    
  end
end