require 'rails_helper'

RSpec.describe 'Movie Show page', type: :feature do
  before :each do

    @actor2 = Actor.create!(name: "Sue", age: 21)
    @actor3 = Actor.create!(name: "Sam", age: 12)
    @actor6 = Actor.create!(name: "Harry", age: 56)


    @actor4 = Actor.create!(name: "Larry", age: 22)
    @actor5 = Actor.create!(name: "Pot", age: 7)

    @east=Studio.create!(name: "east Village", location: 'NYC')

    @brown=@east.movies.create!(title: 'Brown', creation_year: 1999, genre: 'meh')

    ActorMovie.create!(actor_id: @actor2.id, movie_id: @brown.id)
    ActorMovie.create!(actor_id: @actor3.id, movie_id: @brown.id)
    ActorMovie.create!(actor_id: @actor6.id, movie_id: @brown.id)

  end

  describe 'show movie attributes with actors age' do

    it 'show page will list attributes and actors average age' do
      visit studio_movie_path(@east, @brown)

      expect(page).to have_content(@brown.title)
      expect(page).to have_content(@brown.creation_year)
      expect(page).to have_content(@brown.genre)

      expect(page).not_to have_content(@actor4.name)
      expect(page).not_to have_content(@actor5.name)

      within("#actor-0") do
        expect(page).to have_content(@actor3.name)
      end

      within("#actor-1") do
        expect(page).to have_content(@actor2.name)
      end

      within("#actor-2") do
        expect(page).to have_content(@actor6.name)
      end

      expect(page).to have_content(@brown.average_actor_age)
    end
  end
  describe 'can add an actor from show page' do
    it 'will create a new joinstable item using the form' do
      visit studio_movie_path(@east, @brown)

      expect(page).to have_content('Add an actor to this movie:')
      fill_in "Name", with: 'Pot'

      click_button 'Save'

      expect(current_path).to eq(studio_movie_path(@east, @brown))

      within("#actor-0") do
        expect(page).to have_content(@actor5.name)
      end
    end
  end
end

# expect(page).to have_link()
#
# expect(current_path).to eq()
