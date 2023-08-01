require File.dirname(__FILE__) + '/test_helper.rb'

require "test/unit"
class HydeTest < Test::Unit::TestCase
	def test_convert
		assert_equal 1.56, Hyde.hyde_to_metre(1),    "hyde must be 156cm"
		assert_equal 1.56, Hyde.hyde_to_m(1),    "hyde must be 156cm"
		assert_equal    1, Hyde.m_to_hyde(1.56), "156cm must be hyde"
		assert_equal 0.008467, Hyde.barleycorn_to_metre(1)
		assert_equal  0.0254, Hyde.inch_to_metre(1)
		assert_equal  0.3048, Hyde.feet_to_metre(1)
		assert_equal  0.9144, Hyde.yard_to_metre(1)
		assert_equal  5.0292, Hyde.pole_to_metre(1)
		assert_equal  20.1168, Hyde.chain_to_metre(1)
		assert_equal  201.168, Hyde.furlong_to_metre(1)
		assert_equal  1609.344, Hyde.mile_to_metre(1)
		assert_equal  4828.032, Hyde.league_to_metre(1)
	end

	def test_coreextension
		assert_equal  1, 1.56.in_hyde
	end

	def test_command
		c = Hyde::HydeCommand.new
		assert_equal "156.0cm", c.convert("1hyde")
		assert_equal "1.0hyde", c.convert("156cm")
		assert_equal "1.0hyde", c.convert("1.56m")
		assert_equal "1.0hyde", c.convert("0.00156km")
		assert_equal "1.0hyde", c.convert("5.11811024feet")
	end
end
