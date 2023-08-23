require "rails_helper"

RSpec.describe "Orchestras Index",type: :feature do
  describe "as a visitor" do
    describe "when I visit '/orchestras'" do
      it "I see the name of each orchestra record in the system" do
        orchestra_1 = Orchestra.create!(
          name: "Colorado Symphony",
          auditions_open: true,
          year_established: 1989
        )
        orchestra_2 = Orchestra.create!(
          name: "Chicago Symphony Orchestra",
          auditions_open: false,
          year_established: 1891
        )
        orchestra_3 = Orchestra.create!(
          name: "Baltimore Symphony Orchestra",
          auditions_open: true,
          year_established: 1916
        )

        visit "/orchestras"

        expect(page).to have_content("#{orchestra_1.name}")
        expect(page).to have_content("#{orchestra_2.name}")
        expect(page).to have_content("#{orchestra_3.name}")
      end
    end
  end
end