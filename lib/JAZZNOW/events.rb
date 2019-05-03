class JAZZNOW::Events
  attr_accessor :artist, :date, :venue, :city
  @@all = []

  def initialize
    @artist = artist
    @date = date
    @venue = venue
    @city = city
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.open_in_browser
   system("open 'https://nyc.jazznearyou.com/calendar.php' ")
 end
end
