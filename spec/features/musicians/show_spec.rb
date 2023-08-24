require "rails_helper"

RSpec.describe "Musician Show",type: :feature do
  describe "as a visitor" do
    describe "when I visit '/musicians/:id'" do
      it "I see the musician with that id including the musician's attributes" do
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

        visit "/musicians/#{musician_1.id}"

        expect(page).to have_content("#{musician_1.name}")
        expect(page).to have_content("Full Time: #{musician_1.full_time}")
        expect(page).to have_content("Years Involved: #{musician_1.years_involved}")
      end
    end
  end
end