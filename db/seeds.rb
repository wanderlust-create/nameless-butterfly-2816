# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@actor1 = Actor.create!(name: "Bob", age: 32)
@actor2 = Actor.create!(name: "Sue", age: 21)
@actor3 = Actor.create!(name: "Sam", age: 12)
@actor4 = Actor.create!(name: "Harry", age: 56)
@actor5 = Actor.create!(name: "Larry", age: 22)
@actor6 = Actor.create!(name: "Pot", age: 7)

@holly=Studio.create!(name: 'Hollywood', location: 'California')
@bolly=Studio.create!(name: 'Bollywood', location: 'India')
@east=Studio.create!(name: "east Village", location: 'NYC')

@yellow=@holly.movies.create!(title: 'Yellow', creation_year: 2020, genre: 'happy')
@blue=@holly.movies.create!(title: 'Blue', creation_year: 1999, genre: 'sad')
@green=@bolly.movies.create!(title: 'Green', creation_year: 2011, genre: 'meh')
@orange=@bolly.movies.create!(title: 'Orange', creation_year: 2111, genre: 'happy')
@purple=@east.movies.create!(title: 'Purple', creation_year: 1980, genre: 'sad')
@brown=@east.movies.create!(title: 'Brown', creation_year: 1999, genre: 'meh')
ActorMovie.create!(actor_id: @actor1.id, movie_id: @yellow.id)
ActorMovie.create!(actor_id: @actor1.id, movie_id: @blue.id)
ActorMovie.create!(actor_id: @actor1.id, movie_id: @orange.id)
ActorMovie.create!(actor_id: @actor2.id, movie_id: @purple.id)
ActorMovie.create!(actor_id: @actor2.id, movie_id: @brown.id)
ActorMovie.create!(actor_id: @actor3.id, movie_id: @yellow.id)
ActorMovie.create!(actor_id: @actor3.id, movie_id: @orange.id)
ActorMovie.create!(actor_id: @actor4.id, movie_id: @green.id)
ActorMovie.create!(actor_id: @actor5.id, movie_id: @green.id)
ActorMovie.create!(actor_id: @actor6.id, movie_id: @yellow.id)
ActorMovie.create!(actor_id: @actor6.id, movie_id: @blue.id)
