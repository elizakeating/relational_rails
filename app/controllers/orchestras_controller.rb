class OrchestrasController < ApplicationController
  def index
    @orchestras = Orchestra.all
  end

  def show
    
  end
end