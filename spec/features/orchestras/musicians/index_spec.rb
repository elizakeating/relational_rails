require "rails_helper"

RSpec.describe "Orchestra Musicians Index",type: :feature do
  describe "as a visitor" do
    describe "when I visit '/orchestras/id/musicians'" do
      it "I see each musician that is  associated with that orchestra with each musiician's attributes" do
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

        visit "/orchestras/id/musicians"

        expect(page).to have_content("#{musician_1.name}")
        expect(page).to have_content("Full Time: #{musician_1.full_time}")
        expect(page).to have_content("Years Involved: #{musician_1.years_involved}")
        
        expect(page).to have_content("#{musician_2.name}")
        expect(page).to have_content("Full Time: #{musician_2.full_time}")
        expect(page).to have_content("Years Involved: #{musician_2.years_involved}")
      end
    end
  end
end