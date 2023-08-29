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

  describe "as a visitor" do
    describe "when I visit orchestra's show page" do
      it "I see a count of the number of musicians associated with this orchestra" do
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

        visit "/orchestras/#{orchestra_1.id}"

        expect(page).to have_content("Number of Musicians: #{orchestra_1.count_musicians}")
      end
    end
  end

  describe "as a visitor" do
    describe "when I visit an orchestra show page" do
      describe "I see a link to update the orchestra 'Update Orchestra'" do
        describe "when I click the link 'Update Orchestra'" do
          it "I am taken to '/orchestra/:id/edit'" do
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

            visit "/orchestras/#{orchestra_1.id}"

            expect(page).to have_content("Update Orchestra")

            click_link("Update Orchestra")

            expect(current_path).to eq("/orchestras/#{orchestra_1.id}/edit")
          end
        end
      end
    end
  end

  describe "as a visitor" do
    describe "when I visit an orchestra show page" do
      describe "then I see a link to delete the orchestra" do
        describe "when I click the link 'delete orchestra'" do
          it "a delete request is sent to '/orchestras/:id', the orchestra is deleted, all child records are deleted, and i am redirected to the orchestra index page where I no longer see this orchestra" do
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

            visit "/orchestras/#{orchestra_1.id}"

            expect(page).to have_content("Delete #{orchestra_1.name}")

            click_link("Delete #{orchestra_1.name}")

            expect(current_path).to eq("/orchestras")

            expect(page).not_to have_content("Colorado Symphony")

            visit "/musicians"

            expect(page).not_to have_content("#{musician_1.name}")
            expect(page).not_to have_content("Full Time: #{musician_1.full_time}")
            expect(page).not_to have_content("Years Involved: #{musician_1.years_involved}")

            expect(page).not_to have_content("#{musician_2.name}")
            expect(page).not_to have_content("Full Time: #{musician_2.full_time}")
            expect(page).not_to have_content("Years Involved: #{musician_2.years_involved}")
          end
        end
      end
    end
  end
end