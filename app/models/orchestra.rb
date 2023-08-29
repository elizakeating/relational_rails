class Orchestra < ApplicationRecord
  has_many :musicians

  def count_musicians
    self.musicians.count
  end

  def self.descending_created_at
    Orchestra.order(created_at: :desc)
  end

  def sort(params)
    musicians = self.musicians
    if params[:sort] == "name"
      musicians.order(:name)
    elsif params[:sort] == "threshold"
      musicians.where("years_involved > #{params[:threshold_value]}")
    else
      musicians
    end
  end
end