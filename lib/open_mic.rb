require './lib/user'
require './lib/joke'

class OpenMic

  attr_reader :location, :date, :performers
  def initialize(info_hash)
    @location = info_hash[:location]
    @date = info_hash[:date]
    @performers = []
  end

  def welcome(performer)
    @performers << performer
  end

  def repeated_jokes?
    all_jokes = []

    i = 0
    while i < @performers.count

      n = 0
      while n < @performers[i].jokes.count
        if @performers[i].jokes[n] == nil
          n += 1
        else
          all_jokes << @performers[i].jokes[n]
          n += 1
        end
      end

      i += 1
    end

    all_jokes.uniq != all_jokes
  end

end
