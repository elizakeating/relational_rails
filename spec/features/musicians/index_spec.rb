require "rails_helper"

RSpec.describe "Musicians Index",type: :feature do
  describe "as a visitor" do
    describe "when I visit '/musicians'" do
      it "I see each musician in the system including the musician's attributes" do
        musician_1 = Musician.create!(
          name: "Yumi Hwang-Williams",
          full_time: true,
          years_involved: 23
        )
        musician_2 = Musician.create!(
          name: "Dakota Cotugno",
          full_time: false,
          years_involved: 1
        )

        visit "/musicians"

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