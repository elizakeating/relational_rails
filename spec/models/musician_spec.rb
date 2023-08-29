require "rails_helper"

RSpec.describe Musician,type: :model do
  describe "relationships" do
    it { should belong_to :orchestra }
  end

  describe "#show_only_true" do
    it "should show only show musicians that have a true value for full time" do
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

      expect(Musician.show_only_true).to eq([musician_1])
    end
  end
end