class Orchestra < ApplicationRecord
  has_many :musicians

  def count_musicians
    self.musicians.count
  end

  def self.descending_created_at
    Orchestra.order(created_at: :desc)
  end
end