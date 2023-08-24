require "rails_helper"

RSpec.describe Orchestra,type: :model do
  describe "relationships" do
    it { should have_many :musicians }
  end

  describe "#count_musicians" do
    it "returns the count of musicians of that orchestra" do
      orchestra_1 = Orchestra.create!(
        name: "Colorado Symphony",
        auditions_open: true,
        year_established: 1989
      )
      musician_1 = Musician.create!(
        name: "Yumi Hwang-Williams",
        full_time: true,
        years_involved: 23,
        orchestra_id: orchestra_1.id
      )
      musician_2 = Musician.create!(
        name: "Dakota Cotugno",
        full_time: false,
        years_involved: 1,
        orchestra_id: orchestra_1.id
      )

      expect(orchestra_1.count_musicians).to eq(2)
    end
  end
end