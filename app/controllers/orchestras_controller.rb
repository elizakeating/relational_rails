class OrchestrasController < ApplicationController
  def index
    @orchestras = Orchestra.all.order(:created_at)
  end

  def show
    @orchestra = Orchestra.find(params[:id])
  end
end