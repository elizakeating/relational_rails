require "rails_helper"

RSpec.describe Orchestra,type: :model do
  before(:each) do
    @orchestra_1 = Orchestra.create!(
      name: "Colorado Symphony",
      auditions_open: true,
      year_established: 1989
    )
    sleep(1)
    @orchestra_2 = Orchestra.create!(
      name: "Chicago Symphony Orchestra",
      auditions_open: false,
      year_established: 1891
    )
    @musician_1 = Musician.create!(
      name: "Yumi Hwang-Williams",
      full_time: true,
      years_involved: 23,
      orchestra_id: @orchestra_1.id
    )
    @musician_2 = Musician.create!(
      name: "Dakota Cotugno",
      full_time: false,
      years_involved: 1,
      orchestra_id: @orchestra_1.id
    )
  end

  describe "relationships" do
    it { should have_many :musicians }
  end

  describe "#count_musicians" do
    it "returns the count of musicians of that orchestra" do
      expect(@orchestra_1.count_musicians).to eq(2)
    end
  end

  describe "#descending_created_at" do
    it "sorts orchestras by descending created at order" do
      expect(Orchestra.descending_created_at).to eq([@orchestra_2, @orchestra_1])
    end
  end
  
  describe "#sort" do
    it "sorts orchestra's musicians with no given params" do
      expect(@orchestra_1.sort({})).to eq([@musician_1, @musician_2])
    end
    it "sorts orchestra's musicians with name sort param" do
      expect(@orchestra_1.sort({sort: "name"})).to eq([@musician_2, @musician_1])
    end
  end
  it "sorts orchestra's musicians with threshold sort param and a threshold value" do
    expect(@orchestra_1.sort({sort: "threshold", threshold_value: "10"})).to eq([@musician_1])
  end
end