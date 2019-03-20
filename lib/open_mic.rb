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
    @performers.each do |performer|
      performer.jokes.each do |joke|
        all_jokes << joke
      end
    end
    all_jokes.uniq != all_jokes
  end


end
