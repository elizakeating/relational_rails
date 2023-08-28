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
      it "I see that records are ordered by most recently created first and next to each of the records I see when it was created" do
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
        
        visit "/orchestras"

        expect(page).to have_content("Created At: #{orchestra_1.created_at}")
        expect(page).to have_content("Created At: #{orchestra_2.created_at}")
        expect(page).to have_content("Created At: #{orchestra_3.created_at}")

        expect("Created At: #{orchestra_3.created_at}").to appear_before("Created At: #{orchestra_1.created_at}")
        expect("Created At: #{orchestra_3.created_at}").to appear_before("Created At: #{orchestra_2.created_at}")
        expect("Created At: #{orchestra_2.created_at}").to appear_before("Created At: #{orchestra_1.created_at}")
      end
    end
  end

  describe "as a visitor" do
    describe "when I visit any page on the site" do
      it "I see a link at the top of the page that takes me to the Orchestras Index" do
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
        
        click_link("Orchestras Index")

        expect(current_path).to eq("/orchestras")
        
        visit "/orchestras/#{orchestra_1.id}"
        
        click_link("Orchestras Index")

        expect(current_path).to eq("/orchestras")

        visit "/orchestras/#{orchestra_1.id}/musicians"
        
        click_link("Orchestras Index")

        expect(current_path).to eq("/orchestras")

        visit "/musicians"
        
        click_link("Orchestras Index")

        expect(current_path).to eq("/orchestras")

        visit "/musicians/#{musician_1.id}"
        
        click_link("Orchestras Index")

        expect(current_path).to eq("/orchestras")
      end
    end
  end

  describe "as a visitor" do
    describe "when I visit a orchestra show page" do
      it "I see a link to take me to that orchestra's musicians page" do
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

        click_link("Orchestra's Musicians")

        expect(current_path).to eq("/orchestras/#{orchestra_1.id}/musicians")
      end
    end
  end

  describe "as a visitor" do
    describe "when I visit the orchestra index page" do
      describe "I see a link to create a new Orchestra record,'New Orchestra'" do
        describe "when I click the link" do
          it "I am taken to '/orchestras/new'" do
            visit "/orchestras"

            click_link("New Orchestra")

            expect(current_path).to eq("/orchestras/new")
          end
        end
      end
    end
  end

  describe "as a visitor" do
    describe "when I visit the orchestra index page" do
      describe "next to every orchestra, I see a link to edit that orchestra's info" do
        describe "when I click the link" do
          it "I should be taken to that orchestra's edit page where I can update its information just like in User Story 12" do
            orchestra_1 = Orchestra.create!(
              name: "Colorado Symphony",
              auditions_open: true,
              year_established: 1989
            )
            
            visit "/orchestras"
            
            expect(page).to have_content("Update #{orchestra_1.name}")
            
            click_link("Update #{orchestra_1.name}")
            
            expect(current_path).to eq("/orchestras/#{orchestra_1.id}/edit")
          end
        end
      end
    end
  end
end