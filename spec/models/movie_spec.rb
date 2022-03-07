require 'rails_helper'

RSpec.describe Movie do
  describe 'relationships' do
    it { should belong_to :studio }
    it { should have_many :actor_movies}
    it {should have_many(:actors).through(:actor_movies)}
  end

  it 'will display mall studio movies' do
    @east=Studio.create!(name: "east Village", location: 'NYC')
    @orange=@east.movies.create!(title: 'Orange', creation_year: 2111, genre: 'happy')
    @purple=@east.movies.create!(title: 'Purple', creation_year: 1980, genre: 'sad')
    @brown=@east.movies.create!(title: 'Brown', creation_year: 1999, genre: 'meh')

   expect(@east.all_movies).to eq([@orange, @purple, @brown])
  end
end
