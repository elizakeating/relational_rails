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

  describe "as a visitor" do
    describe "when I visit a musician show page" do
      describe "I see a link to update that musician 'Update Musician'" do
        describe "when I click the link" do
          it "I am taken to '/musicians/:id/edit" do
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

            expect(page).to have_content("Update Musician")

            click_link("Update Musician")

            expect(current_path).to eq("/musicians/#{musician_1.id}/edit")
          end
        end
      end
    end
  end

  describe "as a visitor" do
    describe "when I visit a musician show page" do
      describe "then I see a link to delete the musician 'Delete Musician'" do
        describe "when I click the link" do
          it "a DELETE request is sent to '/musicians/:id', the musician is deleted, and I am redirected to the musician index page where I no longer see this musician" do
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

            expect(page).to have_content("Delete #{musician_1.name}")

            click_link("Delete #{musician_1.name}")

            expect(current_path).to eq("/musicians")

            expect(page).not_to have_content("#{musician_1.name}")
            expect(page).not_to have_content("Full Time: #{musician_1.full_time}")
            expect(page).not_to have_content("Years Involved: #{musician_1.years_involved}")
          end
        end
      end
    end
  end
end