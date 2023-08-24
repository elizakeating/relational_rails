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
end