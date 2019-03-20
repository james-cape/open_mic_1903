require 'minitest/autorun'
require 'minitest/pride'
require './lib/joke'
require 'pry'


class JokeTest < Minitest::Test

  def setup
    @joke = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
  end

  def test_joke_exists
    expected = Joke
    actual = @joke
    assert_instance_of expected, actual
  end

    def test_joke_id
      expected = 1
      actual = @joke.id
      assert_equal expected, actual
    end

    def test_joke_setup
      expected = "Why did the strawberry cross the road?"
      actual = @joke.setup
      assert_equal expected, actual
    end

    def test_joke_punchline
      expected = "Because his mother was in a jam."
      actual = @joke.punchline
      assert_equal expected, actual
    end




end
