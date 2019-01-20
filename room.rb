class Room

	attr_reader :name, :capacity, :songs, :occupants

	def initialize(name, capacity)
		@name = name
		@capacity = capacity
		@occupants = []
		@songs = []
	end

	def add_guest_to_room(guest)
		if @occupants.count < @capacity
			@occupants.push(guest)
		else
			return false
		end
	end

	def remove_guest_from_room(guest)
		@occupants.delete(guest)
	end

	def add_song_to_room(song)
		@songs.push(song)
	end

end