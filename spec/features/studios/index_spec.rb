require 'rails_helper'

RSpec.describe 'Studio Index', type: :feature do
  before :each do
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
  end

  describe 'Display the studio name and location' do

    it 'will display studio attributes' do
      visit studios_path

      within("#studio-0") do
        expect(page).to have_content(@holly.name)
        expect(page).to have_content(@holly.location)
        expect(page).to have_content(@yellow.title)
        expect(page).to have_content(@blue.title)
        expect(page).to_not have_content(@green.title)
        expect(page).to_not have_content(@brown.title)
      end

      within("#studio-1") do
        expect(page).to have_content(@bolly.name)
        expect(page).to have_content(@bolly.location)
        expect(page).to have_content(@green.title)
        expect(page).to have_content(@orange.title)
        expect(page).to_not have_content(@yellow.title)
        expect(page).to_not have_content(@brown.title)
      end

      within("#studio-2") do
        expect(page).to have_content(@east.name)
        expect(page).to have_content(@east.location)
        expect(page).to have_content(@purple.title)
        expect(page).to have_content(@brown.title)
        expect(page).to_not have_content(@green.title)
        expect(page).to_not have_content(@orange.title)
      end
    end
  end
end
#
# expect(page).to_not have_content()
#
# expect(page).to have_link()
#
# expect(current_path).to eq()
