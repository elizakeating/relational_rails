require "rails_helper"

RSpec.describe "Orchestra Musicians Index",type: :feature do
  before(:each) do
    @orchestra_1 = Orchestra.create!(
      name: "Colorado Symphony",
      auditions_open: true,
      year_established: 1989
    )
    @musician_1 = Musician.create!(
      name: "Yumi Hwang-Williams",
      full_time: true,
      years_involved: 23,
      orchestra_id: @orchestra_1.id
    )
    @musician_2 = Musician.create!(
      name: "Dakota Cotugno",
      full_time: false,
      years_involved: 1,
      orchestra_id: @orchestra_1.id
    )
  end
  describe "as a visitor" do
    describe "when I visit '/orchestras/id/musicians'" do
      it "I see each musician that is  associated with that orchestra with each musiician's attributes" do
        visit "/orchestras/#{@orchestra_1.id}/musicians"

        expect(page).to have_content("#{@musician_1.name}")
        expect(page).to have_content("Full Time: #{@musician_1.full_time}")
        expect(page).to have_content("Years Involved: #{@musician_1.years_involved}")
        
        expect(page).to have_content("#{@musician_2.name}")
        expect(page).to have_content("Full Time: #{@musician_2.full_time}")
        expect(page).to have_content("Years Involved: #{@musician_2.years_involved}")
      end
    end
  end

  describe "as a visitor" do
    describe "when I visit an orchestra musicians index page" do
      describe "I see a link to add a new musician for that orchestra 'Create Musician" do
        it "when I click the link I am taken to /orchestra/:id/musicians/new" do
          visit "/orchestras/#{@orchestra_1.id}/musicians"

          expect(page).to have_content("Create Musician")

          click_link("Create Musician")

          expect(current_path).to eq("/orchestras/#{@orchestra_1.id}/musicians/new")
        end
      end
    end
  end

  describe "as a visitor" do
    describe "when I visit the orchestra's musicians index page" do
      describe "I see a link to sort musicians in alphabetical order" do
         describe "when I click on the link" do
          it "I'm taken back tot he orchestra's musicians index page where i see all of the orchestra's musicians in alphabetical order" do
            visit "/orchestras/#{@orchestra_1.id}/musicians"

            expect(page).to have_content("Sort By Name Alphabetically")

            click_link("Sort By Name Alphabetically")

            expect(current_path).to eq("/orchestras/#{@orchestra_1.id}/musicians")

            expect("#{@musician_2.name}").to appear_before("#{@musician_1.name}")
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
            visit "/orchestras/#{@orchestra_1.id}/musicians"

            expect(page).to have_content("Update #{@musician_1.name}")

            click_link("Update #{@musician_1.name}")

            expect(current_path).to eq("/musicians/#{@musician_1.id}/edit")
          end
        end
      end
    end
  end

  describe "as a visitor" do
    describe "when I visit the Orchestra's musicians Index page" do
      describe "I see a form that allows me to input a number value" do
        describe "when I input a number value and click the submit button that reads 'only return records with more than number of column_name'" do
          it "I am brought back tot he current index page with only the records that meet that threshold shown" do
            visit "/orchestras/#{@orchestra_1.id}/musicians"

            expect(page).to have_content("Sort by Threshold")

            click_link("Sort by Threshold")

            expect(current_path).to eq("/orchestras/#{@orchestra_1.id}/musicians/threshold")

            expect(page).to have_content("Insert Threshold Value:")

            fill_in "threshold_value", with: "10"

            click_button("Only return records with more than Threshold Value of Years Involved")

            expect(current_path).to eq("/orchestras/#{@orchestra_1.id}/musicians")

            expect(page).not_to have_content("Dakota Cotungo")
            expect(page).not_to have_content("Full Time: false")
            expect(page).not_to have_content("Years Involved: 1")
          end
        end
      end
    end
  end

  describe "as a visitor" do
    describe "when I visit an orchestra's musicians index page" do
      describe "next to every musician, I see a link to delete that musician" do
        describe "when I click the link" do
          it "I should taken to that orchestra's musicians index page where I no longer see that musician" do
            visit "/orchestras/#{@orchestra_1.id}/musicians"

            expect(page).to have_content("Delete #{@musician_1.name}")
            
            click_button("Delete #{@musician_1.name}")

            expect(current_path).to eq("/musicians")

            expect(page).not_to have_content("Yumi Hwang-Williams")
            expect(page).not_to have_content("Years Involved: 23")
          end
        end
      end
    end
  end
end