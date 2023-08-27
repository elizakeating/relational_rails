# Iteration 1

## CRUD

[x] done

User Story 1, Parent Index 

For each orchestra table
As a visitor
When I visit '/orchestras'
Then I see the name of each orchestra record in the system

-----

[x] done

User Story 2, Parent Show 

As a visitor
When I visit '/orchestras/:id'
Then I see the orchestra with that id including the orchestra's attributes
(data from each column that is on the orchestra table)

-----

[x] done

User Story 3, Child Index 

As a visitor
When I visit '/musicians'
Then I see each musician in the system including the musician's attributes
(data from each column that is on the musician table)

-----

[x] done

User Story 4, Child Show 

As a visitor
When I visit '/musicians/:id'
Then I see the musician with that id including the musician's attributes
(data from each column that is on the musician table)

-----

[x] done

User Story 5, Parent Children Index 

As a visitor
When I visit '/orchestras/:orchestra_id/musicians'
Then I see each musician that is associated with that Orchestra with each musician's attributes
(data from each column that is on the musician table)

## ActiveRecord

[x] done

User Story 6, Parent Index sorted by Most Recently Created 

As a visitor
When I visit the orchestra index,
I see that records are ordered by most recently created first
And next to each of the records I see when it was created

-----

[x] done

User Story 7, Parent Child Count

As a visitor
When I visit a orchestra's show page
I see a count of the number of musicians associated with this orchestra

## Usability

[x] done

User Story 8, Child Index Link

As a visitor
When I visit any page on the site
Then I see a link at the top of the page that takes me to the Musician Index

-----

[x] done

User Story 9, Parent Index Link

As a visitor
When I visit any page on the site
Then I see a link at the top of the page that takes me to the Orchestra Index

-----

[x] done

User Story 10, Parent Child Index Link

As a visitor
When I visit a orchestra show page ('/orchestras/:id')
Then I see a link to take me to that orchestra's `musicians` page ('/orchestras/:id/musicians')

# Iteration 2

## CRUD

[x] done

User Story 11, Parent Creation 

As a visitor
When I visit the Orchestra Index page
Then I see a link to create a new Orchestra record, "New Orchestra"
When I click this link
Then I am taken to '/orchestras/new' where I  see a form for a new orchestra record
When I fill out the form with a new orchestra's attributes:
And I click the button "Create Orchestra" to submit the form
Then a `POST` request is sent to the '/orchestras' route,
a new orchestra record is created,
and I am redirected to the Orchestra Index page where I see the new Orchestra displayed.

-----

[x] done

User Story 12, Parent Update 

As a visitor
When I visit a orchestra show page
Then I see a link to update the orchestra "Update Orchestra"
When I click the link "Update Orchestra"
Then I am taken to '/orchestras/:id/edit' where I see a form to edit the orchestra's attributes:
When I fill out the form with updated information
And I click the button to submit the form
Then a `PATCH` request is sent to '/orchestras/:id',
the orchesta's info is updated,
and I am redirected to the Orhcestra's Show page where I see the Orchestra's updated info

-----

[x] done

User Story 13, Parent Child Creation 

As a visitor
When I visit a Orchestra Musicians Index page
Then I see a link to add a new musician for that orchestra "Create Musician"
When I click the link
I am taken to '/orchestra/:orchestra_id/musicians/new' where I see a form to add a new musician
When I fill in the form with the musician's attributes:
And I click the button "Create Musician"
Then a `POST` request is sent to '/orchestras/:orchestra_id/musicians',
a new musician object/row is created for that orchestra,
and I am redirected to the Orchestra Musicians Index page where I can see the new musician listed

-----

[x] done

User Story 14, Child Update 

As a visitor
When I visit a Musician Show page
Then I see a link to update that Musician "Update Musician"
When I click the link
I am taken to '/musicians/:id/edit' where I see a form to edit the musician's attributes:
When I click the button to submit the form "Update Musicians"
Then a `PATCH` request is sent to '/musicians/:id',
the musician's data is updated,
and I am redirected to the Musician Show page where I see the Musician's updated information

## ActiveRecord

[ ] done

User Story 15, Child Index only shows `true` Records 

As a visitor
When I visit the musician index
Then I only see records where the boolean column is `true`

-----

[ ] done

User Story 16, Sort Parent's Children in Alphabetical Order by name 

As a visitor
When I visit the Orchestra's Musicians Index Page
Then I see a link to sort musicians in alphabetical order
When I click on the link
I'm taken back to the Orchestra's musicians Index Page where I see all of the orchestra's musicians in alphabetical order

## Usability

[ ] done

User Story 17, Parent Update From Parent Index Page 

As a visitor
When I visit the orchestra index page
Next to every orchestra, I see a link to edit that orchestra's info
When I click the link
I should be taken to that orchestra's edit page where I can update its information just like in User Story 12

-----

[ ] done

User Story 18, Child Update From Childs Index Page 

As a visitor
When I visit the `musicians` index page or a orchestra `musicians` index page
Next to every musician, I see a link to edit that musician's info
When I click the link
I should be taken to that `musicians` edit page where I can update its information just like in User Story 14

# Iteration 3

## CRUD

[ ] done

User Story 19, Parent Delete 

As a visitor
When I visit a orchestra show page
Then I see a link to delete the orchestra
When I click the link "Delete Orchestra"
Then a 'DELETE' request is sent to '/orchestras/:id',
the orchestra is deleted, and all child records are deleted
and I am redirected to the orchestra index page where I no longer see this orchestra

-----

[ ] done

User Story 20, Child Delete 

As a visitor
When I visit a musician show page
Then I see a link to delete the musician "Delete Musician"
When I click the link
Then a 'DELETE' request is sent to '/musicians/:id',
the musician is deleted,
and I am redirected to the musician index page where I no longer see this musician

## ActiveRecord

[ ] done

User Story 21, Display Records Over a Given Threshold 

As a visitor
When I visit the Orchestra's musicians Index Page
I see a form that allows me to input a number value
When I input a number value and click the submit button that reads 'Only return records with more than `number` of `column_name`'
Then I am brought back to the current index page with only the records that meet that threshold shown.

## Usability

[ ] done

User Story 22, Parent Delete From Parent Index Page 

As a visitor
When I visit the orchestra index page
Next to every orchestra, I see a link to delete that orchestra
When I click the link
I am returned to the Orchestra Index Page where I no longer see that orchestra

-----

[ ] done

User Story 23, Child Delete From Childs Index Page 

As a visitor
When I visit the `musicians` index page or a parent `musicians` index page
Next to every musician, I see a link to delete that musician
When I click the link
I should be taken to the `musicians` index page where I no longer see that musician

# Extensions

[ ] done

Extension 1: Sort Parents by Number of Children 

As a visitor
When I visit the Orchestra Index Page
Then I see a link to sort orchestras by the number of `musicians` they have
When I click on the link
I'm taken back to the Orchestra Index Page where I see all of the orchestras in order of their count of `musicians` (highest to lowest) And, I see the number of musicians next to each orchestra name

-----

[ ] done

Extension 2: Search by name (exact match)

As a visitor
When I visit an index page ('/parents') or ('/child_table_name')
Then I see a text box to filter results by keyword
When I type in a keyword that is an exact match of one or more of my records and press the Search button
Then I only see records that are an exact match returned on the page

-----

[ ] done

Extension 3: Search by name (partial match)

As a visitor
When I visit an index page ('/orchestras') or ('/musicians')
Then I see a text box to filter results by keyword
When I type in a keyword that is an partial match of one or more of my records and press the Search button
Then I only see records that are an partial match returned on the page

This functionality should be separate from your exact match functionality.