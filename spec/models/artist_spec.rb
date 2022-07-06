require 'rails_helper'  

RSpec.describe Artist do
    it {should have_many :songs}

    describe 'instance methods' do
        describe '#average_song_length' do
            before :each do 
                @prince = Artist.create!(name: 'Prince')
                @purple = @prince.songs.create!(title: 'Purple Rain', length: 846, play_count: 8999)
                @beret = @prince.songs.create!(title: 'Raspberry Beret', length: 300, play_count: 7550)
                @ninteen_ninety_nine = @prince.songs.create!(title: '1999', length: 305, play_count: 7550)

            end
            it 'returns the average song length' do
                expect(@prince.average_song_length.round(2)).to eq(483.67)
            end
        end
    end
end