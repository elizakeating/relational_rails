require "rails_helper"

RSpec.describe "Musicians Index",type: :feature do
  describe "as a visitor" do
    describe "when I visit '/musicians'" do
      it "I see each musician in the system including the musician's attributes" do
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
          full_time: true, #how do i deal with this?
          years_involved: 1,
          orchestra_id: orchestra_1.id
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

  describe "as a visitor" do
    describe "when I visit any page on the site" do
      it "I see a link at the top of the page that takes me to the Musician Index" do
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

        visit "/orchestras"
        
        click_link("Musicians Index")

        expect(current_path).to eq("/musicians")
        
        visit "/orchestras/#{orchestra_1.id}"
        
        click_link("Musicians Index")

        expect(current_path).to eq("/musicians")

        visit "/orchestras/#{orchestra_1.id}/musicians"
        
        click_link("Musicians Index")

        expect(current_path).to eq("/musicians")

        visit "/musicians"
        
        click_link("Musicians Index")

        expect(current_path).to eq("/musicians")

        visit "/musicians/#{musician_1.id}"
        
        click_link("Musicians Index")

        expect(current_path).to eq("/musicians")
      end
    end
  end

  describe "as a visitor" do
    describe "when I visit the musician index" do
      it "I only see the records where the boolean column is 'true'" do
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

        visit "/musicians"

        expect(page).to have_content("#{musician_1.name}")
        expect(page).to have_content("Full Time: #{musician_1.full_time}")
        expect(page).to have_content("Years Involved: #{musician_1.years_involved}")

        expect(page).not_to have_content("#{musician_2.name}")
        expect(page).not_to have_content("Full Time: #{musician_2.full_time}")
        expect(page).not_to have_content("Years Involved: #{musician_2.years_involved}")
      end
    end
  end

  describe "as a visitor" do
    describe "when I visit the musicians index page" do
      describe "next to ever musician, I see a link to edit that musician's info" do
        describe "when I click the link" do
          it "I should be taken to that musicians edit page" do
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

            visit "/musicians"

            expect(page).to have_content("Update #{musician_1.name}")

            click_link("Update #{musician_1.name}")

            expect(current_path).to eq("/musicians/#{musician_1.id}/edit")
          end
        end
      end
    end
  end
end