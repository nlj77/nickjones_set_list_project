require 'rails_helper'

RSpec.describe "the songs show page" do
    #As a visitor
    #When I visit /songs/1 (where 1 is the id of a song in my database)
    #Then I see that song's title, and artist, and no other songs in database
    it 'displays the song title' do
        artist = Artist.create(name: 'Carly Rae Jepsen')
        song = artist.songs.create!(title: "I Really Like You", length: 208, play_count: 265808)
        song2 = artist.songs.create!(title: "Call Me Maybe", length: 230, play_count: 999999)

        visit "/songs/#{song.id}"

        expect(page).to have_content(song.title)
        expect(page).to_not have_content(song2.title)
    end

    it 'displays the name of the artist for the song'
end