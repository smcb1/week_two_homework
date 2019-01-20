require("minitest/autorun")
require("minitest/rg")
require("pry")
require_relative("../Guest")

class TestGuest < Minitest::Test

	def setup
		@guest1 = Guest.new("Dave", 5) # name, wallet
		@guest2 = Guest.new("Jimmy", 10)
		@guest3 = Guest.new("Betty", 15)
		@guest4 = Guest.new("Susie", 20)
	end

	def test_guest_has_name
		assert_equal("Dave", @guest1.name)
	end

	def test_guest_has_wallet
		assert_equal(15, @guest3.wallet)
	end

end