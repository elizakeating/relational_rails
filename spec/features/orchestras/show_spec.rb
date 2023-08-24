require "rails_helper"

RSpec.describe "Orchestra Show",type: :feature do
  describe "as a visitor" do
    describe "when I visit '/orchestras/:id'" do
      it "I see the orchestra with that id including the orchestra's attributes" do
        orchestra_1 = Orchestra.create!(
          name: "Colorado Symphony",
          auditions_open: true,
          year_established: 1989
        )

        visit "/orchestras/#{orchestra_1.id}"

        expect(page).to have_content("#{orchestra_1.name}")
        expect(page).to have_content("Auditions Open: #{orchestra_1.auditions_open}")
        expect(page).to have_content("Year Established: #{orchestra_1.year_established}")
      end
    end
  end

  describe "as a visitor" do
    describe "when I visit orchestra's show page" do
      it "I see a count of the number of musicians associated with this orchestra" do
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

        visit "/orchestras/#{orchestra_1.id}"

        expect(page).to have_content("Number of Musicians: #{orchestra_1.count_musicians}")
      end
    end
  end
end