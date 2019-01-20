require("minitest/autorun")
require("minitest/rg")
require("pry")
require_relative("../Room")
require_relative("../Guest")
require_relative("../Song")


class TestRoom < MiniTest::Test

	def setup
		@room1 = Room.new("Small Room", 3) # name, capacity, 
		@room2 = Room.new("Big Room", 6)

		@song1 = Song.new("ABBA", "Dancing Queen") # artist, title
		@song2 = Song.new("David Bowie", "Heros")
		@song3 = Song.new("Queen", "Bohemian Rhapsody")
		@song4 = Song.new("The Kinks", "Lola")
		@songs = [@song1, @song2, @song3, @song4] 

		@guest1 = Guest.new("Dave", 5) # name, wallet
		@guest2 = Guest.new("Jimmy", 10)
		@guest3 = Guest.new("Betty", 15)
		@guest4 = Guest.new("Susie", 20)
		@guests = [@guest1, @guest2, @guest3, @guest4]
	end

	def test_room_has_name
		assert_equal("Small Room", @room1.name)
		assert_equal("Big Room", @room2.name)
	end

	def test_room_capacity
		assert_equal(3, @room1.capacity)
		assert_equal(6, @room2.capacity)
	end

	def test_add_song_to_room
		@room1.add_song_to_room(@song4)
		assert_equal("Lola", @songs[3].title)
	end

	def test_room_has_songs
		assert_equal(4, @songs.count)
	end

	def test_song_play
		assert_equal("Dancing Queen", @songs[0].title)
		assert_equal("David Bowie", @songs[1].artist)
	end

	def test_add_guest_to_room
		@room1.add_guest_to_room(@guest1)
		assert_equal(1, @room1.occupants.count)
	end

	def test_add_guest_to_room__full
		@room1.add_guest_to_room(@guest1)
		@room1.add_guest_to_room(@guest2)
		@room1.add_guest_to_room(@guest3)
		
		assert_equal(@room1.capacity, @room1.occupants.count) # Room capacity reached
		assert_equal(false, @room1.add_guest_to_room(@guest4)) # Attempt to add guest - return false
	end

	def test_remove_guest_from_room
		@room1.add_guest_to_room(@guest1)
		@room1.add_guest_to_room(@guest2)
		
		@room1.remove_guest_from_room(@guest2)
		
		assert_equal(1, @room1.occupants.count)
		assert_equal("Dave", @room1.occupants[0].name)
	end

end
