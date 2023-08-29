class Musician < ApplicationRecord
  belongs_to :orchestra

  def self.show_only_true
    Musician.where(full_time: "true")
  end
end