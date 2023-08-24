# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
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