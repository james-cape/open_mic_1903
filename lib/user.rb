class User

  attr_reader :name, :jokes
  def initialize(name)
    @name = name
    @jokes = []
  end

  def learn(joke)
    @jokes << joke
  end

# Allows one user to pass a joke to another user.
  def tell(name, joke)
    name.learn(joke)
  end

  def joke_by_id(index)

    jokes[ index - 1 ]


  end





end
