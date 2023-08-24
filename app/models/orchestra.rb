class Orchestra < ApplicationRecord
  has_many :musicians

  def count_musicians
    self.musicians.count
  end
end