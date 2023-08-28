require "rails_helper"

RSpec.describe "Orchestra Musicians Index",type: :feature do
  describe "as a visitor" do
    describe "when I visit '/orchestras/id/musicians'" do
      it "I see each musician that is  associated with that orchestra with each musiician's attributes" do
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

        visit "/orchestras/#{orchestra_1.id}/musicians"

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
    describe "when I visit an orchestra musicians index page" do
      describe "I see a link to add a new musician for that orchestra 'Create Musician" do
        it "when I click the link I am taken to /orchestra/:id/musicians/new" do
          orchestra_1 = Orchestra.create!(
            name: "Colorado Symphony",
            auditions_open: true,
            year_established: 1989
          )

          visit "/orchestras/#{orchestra_1.id}/musicians"

          expect(page).to have_content("Create Musician")

          click_link("Create Musician")

          expect(current_path).to eq("/orchestras/#{orchestra_1.id}/musicians/new")
        end
      end
    end
  end

  describe "as a visitor" do
    describe "when I visit the orchestra's musicians index page" do
      describe "I see a link to sort musicians in alphabetical order" do
         describe "when I click on the link" do
          it "I'm taken back tot he orchestra's musicians index page where i see all of the orchestra's musicians in alphabetical order" do
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

            visit "/orchestras/#{orchestra_1.id}/musicians"

            expect(page).to have_content("Sort By Name Alphabetically")

            click_link("Sort By Name Alphabetically")

            expect(current_path).to eq("/orchestras/#{orchestra_1.id}/musicians")

            expect("#{musician_2.name}").to appear_before("#{musician_1.name}")
          end
        end
      end
    end
  end

  describe "as a visitor" do
    describe "when I visit an orchestra's musicians index page" do
      describe "next to every musician, I see a link to edit that musician's info" do
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

            visit "/orchestras/#{orchestra_1.id}/musicians"

            expect(page).to have_content("Update #{musician_1.name}")

            click_link("Update #{musician_1.name}")

            expect(current_path).to eq("/musicians/#{musician_1.id}/edit")
          end
        end
      end
    end
  end
end