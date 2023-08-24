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
  
  describe "as a visitor" do
    describe "when I visit the orchestra index" do
      orchestra_1 = Orchestra.create!(
        name: "Colorado Symphony",
        auditions_open: true,
        year_established: 1989
      )
      sleep(1)
      orchestra_2 = Orchestra.create!(
        name: "Chicago Symphony Orchestra",
        auditions_open: false,
        year_established: 1891
      )
      sleep(1)
      orchestra_3 = Orchestra.create!(
        name: "Baltimore Symphony Orchestra",
        auditions_open: true,
        year_established: 1916
      )

      let(:created_at_1) { "<p>Created At: #{orchestra_1.created_at}</p>" }
      let(:created_at_2) { "<p>Created At: #{orchestra_2.created_at}</p>" }
      let(:created_at_3) { "<p>Created At: #{orchestra_3.created_at}</p>" }

      it "I see that records are ordered by most recently created first and next to each of the records I see when it was created" do
        visit "/orchestras"

        expect(page).to have_content("Created At: #{orchestra_1.created_at}")
        expect(page).to have_content("Created At: #{orchestra_2.created_at}")
        expect(page).to have_content("Created At: #{orchestra_3.created_at}")

        expect(created_at_1).to appear_before(created_at_2)
        expect(created_at_1).to appear_before(created_at_3)
        expect(created_at_2).to appear_before(created_at_3)
      end
    end
  end
end