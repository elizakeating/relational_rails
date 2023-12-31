class MusiciansController < ApplicationController
  def index
    @musicians = Musician.show_only_true
  end

  def show
    @musician = Musician.find(params[:id])
  end

  def edit
    @musician = Musician.find(params[:id])
  end

  def update
    musician = Musician.find(params[:id])
    musician.update({
      name: params[:name],
      full_time: params[:full_time],
      years_involved: params[:years_involved]
    })

    musician.save
    
    redirect_to "/musicians/#{musician.id}"
  end

  def destroy
    Musician.destroy(params[:id])
    redirect_to "/musicians"
  end
end