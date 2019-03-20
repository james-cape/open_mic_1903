require 'minitest/autorun'
require 'minitest/pride'
require './lib/joke'
require './lib/user'
require './lib/open_mic'
require 'pry'

class OpenMicTest < Minitest::Test

  def setup
    @open_mic = OpenMic.new({location: "Comedy Works", date: "11-20-18"})

    @sal = User.new("Sal")
    @ali = User.new("Ali")

    @joke_1 = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
    @joke_2 = Joke.new(2, "How do you keep a lion from charging?", "Take away its credit cards.")
  end

  def test_open_mic_location
    expected = "Comedy Works"
    actual = @open_mic.location
    assert_equal expected, actual
  end

  def test_open_mic_date
    expected = "11-20-18"
    actual = @open_mic.date
    assert_equal expected, actual
  end

  def test_no_initial_open_mic_performers
    expected = []
    actual = @open_mic.performers
    assert_equal expected, actual
  end

## Welcome performers Sal and Ali

  def test_two_open_mic_performers
    @open_mic.welcome(@sal)
    @open_mic.welcome(@ali)


    expected = 2
    actual = @open_mic.performers.count
    assert_equal expected, actual
  end

## Add two jokes
  def test_two_added_jokes_not_duplicates
    @open_mic.welcome(@sal)
    @open_mic.welcome(@ali)

    @ali.learn(@joke_1)
    @ali.learn(@joke_2)

    expected = false
    actual = @open_mic.repeated_jokes?
    assert_equal expected, actual
  end

## Ali learns a duplicate joke
  def test_ali_tells_sal_a_duplicate_joke

    @open_mic.welcome(@sal)
    @open_mic.welcome(@ali)

    @ali.learn(@joke_1)
    @ali.learn(@joke_2)

    @ali.tell(@sal, @joke_1)

    expected = true
    actual = @open_mic.repeated_jokes?
    assert_equal expected, actual
  end

end
