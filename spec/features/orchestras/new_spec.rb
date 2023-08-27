require "rails_helper"

RSpec.describe "New Orchestra",type: :feature do
  describe "when I visit '/orchestras/new'" do
    describe "when I fill out the form with a new orchestra's attributes" do
      describe "when I click the button 'Create Orchestra' to submit the form" do
        it "a post request is sent to the '/orchestras/ route, a new orchestra record is created, I am redirected to the Orchestra Index page where I see the new Orchestra displayed" do
          visit "/orchestras/new"

          expect(page).to have_content("Orchestra Name:")
          expect(page).to have_content("Auditions Open:")
          expect(page).to have_content("Year Established:")

          fill_in 'name', with: 'Random Orchestra'
          select 'true', from: "auditions_open"
          fill_in "year_established", with: "2023"

          click_button 'Create Orchestra'

          expect(current_path).to eq("/orchestras")

          expect(page).to have_content("Random Orchestra")
        end
      end
    end
  end
end