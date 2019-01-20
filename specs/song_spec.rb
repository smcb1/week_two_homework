require("minitest/autorun")
require("minitest/rg")
require("pry")
require_relative("../Song")

class TestSong < Minitest::Test

	def setup
		@song1 = Song.new("ABBA", "Dancing Queen") # artist, title
		@song2 = Song.new("David Bowie", "Heros")
		@song3 = Song.new("Queen", "Bohemian Rhapsody")
		@song4 = Song.new("The Kinks", "Lola")
		@songs = [@song1, @song2, @song3, @song4] # Place all the songs in an array
	end

	def test_song_has_artist
		assert_equal("ABBA", @song1.artist)
		assert_equal("David Bowie", @song2.artist)
	end

	def test_song_has_title
		assert_equal("Bohemian Rhapsody", @song3.title)
		assert_equal("Lola", @song4.title)
	end

end