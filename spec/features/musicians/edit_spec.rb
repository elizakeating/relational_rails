require "rails_helper"

RSpec.describe "Update Musician",type: :feature do
  describe "when I visit '/musicians/:id/edit via link on the show page" do
    describe "when I fill out the form with the updated musicians information" do
      describe "when I click the button 'Update Musicians' to submit the form" do
        it "a patch request is sent to '/musicians/:id', the musician's data is updated, and I am redirected to the musician show page where I see the musician's updated information" do
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

          click_link("Update Musician")

          expect(current_path).to eq("/musicians/#{musician_1.id}/edit")

          expect(page).to have_content("Update Musician")
          expect(page).to have_content("Musician Name:")
          expect(page).to have_content("Full Time:")
          expect(page).to have_content("Years Involved:")

          fill_in "name", with: "Yumi Williams"
          select "false", from: "full_time"
          fill_in "years_involved", with: "12"

          click_button("Update Musician")

          expect(current_path).to eq("/musicians/#{musician_1.id}")

          expect(page).to have_content("Musician Name: Yumi Williams")
          expect(page).to have_content("Full Time: false")
          expect(page).to have_content("Years Involved: 12")
        end
      end
    end
  end
end