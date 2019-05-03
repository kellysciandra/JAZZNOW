class JAZZNOW::Scraper

  def scrape_events
    @doc = Nokogiri::HTML(open('https://nyc.jazznearyou.com/calendar.php'))
    @doc.search("div.col").collect do |name|
      event = JAZZNOW::Events.new
        #creating an event ....event is = to an instance of an event 
      event.artist = name.css('div.panel-body').css('h4').text.strip
      # properties of an event
      event.date = name.css(".panel-title").text.strip
      event.venue = name.css('div.panel-body').css('.caption-text').css('a').text.strip
      event.city = name.css('div.panel-body').css('.caption-text').css('.hide-480').text.strip
      event.save
    end
  end
end
