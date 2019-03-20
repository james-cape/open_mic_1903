require 'minitest/autorun'
require 'minitest/pride'
require './lib/joke'
require './lib/user'
require 'pry'

class UserTest < Minitest::Test

  def setup
    @sal = User.new("Sal")
    @ali = User.new("Ali")

    @joke_1 = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
    @joke_2 = Joke.new(2, "How do you keep a lion from charging?", "Take away its credit cards.")

  end

  def test_user_has_name
    expected = "Sal"
    actual = @sal.name
    assert_equal expected, actual
  end

  def test_user_has_empty_jokes_array
    expected = []
    actual = @sal.jokes
    assert_equal expected, actual
  end

  def test_add_jokes_to_array
    @sal.learn(@joke_1)
    @sal.learn(@joke_2)

    expected = 2
    actual = @sal.jokes.count
    assert_equal expected, actual
  end

#### Begin iteration 3
  def test_user_can_teach_second_user_a_joke
    @sal.tell(@ali, @joke_1)
    @sal.tell(@ali, @joke_2)

    expected = 2
    actual = @ali.jokes.count
    assert_equal expected, actual
  end

  def test_first_joke_in_second_users_jokes_array
    @sal.tell(@ali, @joke_1)
    @sal.tell(@ali, @joke_2)

    expected = "Why did the strawberry cross the road?"
    actual = @ali.joke_by_id(1).setup
    assert_equal expected, actual
  end

  def test_second_joke_in_second_users_jokes_array
    @sal.tell(@ali, @joke_1)
    @sal.tell(@ali, @joke_2)

    expected = "How do you keep a lion from charging?"
    actual = @ali.joke_by_id(2).setup
    assert_equal expected, actual
  end

#### Begin iteration 4









end
