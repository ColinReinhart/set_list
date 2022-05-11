require 'rails_helper'

RSpec.describe Artist do
  it {should have_many :songs}

  describe "instance methods" do
    describe '#average_song_length' do
      before :each do
        @prince = Artist.create!(name: "Prince")
        @purple = @prince.songs.create(title: "Purple Rain", length: 123, play_count: 123)
        @beret = @prince.songs.create(title: "Raspberry Beret", length: 14, play_count: 1023)
        @another = @prince.songs.create(title: "Another", length: 2, play_count: 1023)
      end

      it 'returns the average song length' do
        expect(@prince.average_song_length.round(2)).to eq(46.33)
      end
    end
  end
end
