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
musician_3 = Musician.create!(
  name: "Claude Sim",
  full_time: true,
  years_involved: 20,
  orchestra_id: orchestra_1.id
)
musician_4 = Musician.create!(
  name: "Seoyoen Min",
  full_time: true,
  years_involved: 4,
  orchestra_id: orchestra_1.id
)
musician_5 = Musician.create!(
  name: "Robert Chen",
  full_time: true,
  years_involved: 24,
  orchestra_id: orchestra_2.id
)
musician_6 = Musician.create!(
  name: "John Sharp",
  full_time: false,
  years_involved: 35,
  orchestra_id: orchestra_2.id
)
musician_7 = Musician.create!(
  name: "Brant Taylor",
  full_time: true,
  years_involved: 15,
  orchestra_id: orchestra_2.id
)
musician_8 = Musician.create!(
  name: "Jonathan Carney",
  full_time: true,
  years_involved: 21,
  orchestra_id: orchestra_3.id
)
musician_9 = Musician.create!(
  name: "Dariusz Skoraczewski",
  full_time: false,
  years_involved: 35,
  orchestra_id: orchestra_3.id
)
musician_10 = Musician.create!(
  name: "Kristin Ostling",
  full_time: true,
  years_involved: 28,
  orchestra_id: orchestra_3.id
)