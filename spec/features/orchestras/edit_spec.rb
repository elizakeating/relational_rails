require "rails_helper"

RSpec.describe "Edit Orchestra",type: :feature do
  describe "when I visit '/orchestras/:id/edit' via the link on show page" do
    describe "when I fill out the form with the updated orchestras information" do
      describe "when I click the button 'Edit Orchestra'" do
        it "A patch request is sent to '/orchestras/:id', the orchestra's info is updated, and I am redirected to the Orchestra's show page where I see the Orchestra's updated info" do
          orchestra_1 = Orchestra.create!(
            name: "Colorado Symphony",
            auditions_open: true,
            year_established: 1989
          )

          visit "/orchestras/#{orchestra_1.id}"

          expect(page).to have_content("#{orchestra_1.name}")
          expect(page).to have_content("Auditions Open: #{orchestra_1.auditions_open}")
          expect(page).to have_content("Year Established: #{orchestra_1.year_established}")

          click_link("Update Orchestra")

          expect(current_path).to eq("/orchestras/#{orchestra_1.id}/edit")

          expect(page).to have_content("Update Orchestra")
          expect(page).to have_content("Orchestra Name:")
          expect(page).to have_content("Auditions Open:")
          expect(page).to have_content("Year Established:")

          fill_in 'name', with: "Colorado New Symphony"
          select 'false', from: "auditions_open"
          fill_in "year_established", with: "2023"

          click_button "Update Orchestra"

          expect(current_path).to eq("/orchestras/#{orchestra_1.id}")

          expect(page).to have_content("Colorado New Symphony")
          expect(page).to have_content("Auditions Open: false")
          expect(page).to have_content("Year Established: 2023")
        end
      end
    end
  end
end