require "rails_helper"

RSpec.describe "New Musician",type: :feature do
  describe "when I visit /orchestras/:id/musicians/new" do
    describe "when I fill out the form with the new musician's attributes" do
      describe "when I click the button 'Create Musician'" do
        it "a post request is sent to '/orchestras/:id/musicians', a new musician object/row is created for that orchestra, and i am redirected to the orchestra musicians index page where I can see the new musician listed" do
          orchestra_1 = Orchestra.create!(
            name: "Colorado Symphony",
            auditions_open: true,
            year_established: 1989
          )

          visit "/orchestras/#{orchestra_1.id}/musicians/new"

          expect(page).to have_content("Musician Name:")
          expect(page).to have_content("Full Time:")
          expect(page).to have_content("Years Involved:")

          fill_in "name", with: "First Last"
          select "false", from: "full_time"
          fill_in "years_involved", with: "12"

          click_button "Create Musician"

          expect(current_path).to eq("/orchestras/#{orchestra_1.id}/musicians")

          expect(page).to have_content("First Last")
          expect(page).to have_content("Full Time: false")
          expect(page).to have_content("Years Involved: 12")
        end
      end
    end
  end
end