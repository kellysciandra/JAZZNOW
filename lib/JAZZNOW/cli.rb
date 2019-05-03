class JAZZNOW::CLI

  def call
    fun_intro
    JAZZNOW::Scraper.new.scrape_events
    menu
  end

  def fun_intro
    puts"                    NYC JAZZ".bold.red
      sleep 2
    puts "
                          ___________/|
                           (__|||__) \|


                          ======o     o======
                             ___________
                            |___________|
                             |\  /\  /\|
                             |_\/__\/__|
                            |___________|".bold.cyan
  puts "                        "
    sleep 2

  end

  def list_events
    JAZZNOW::Events.all.each_with_index do |event, index|
      until index == 9
      puts "#{index +1}. #{event.artist}".bold
      break
      end
    end
  end

  def menu
    puts"            What event are you interested in?".bold.red
    puts"              -------Please type a number".bold.cyan
    list_events

    input = ""
    input = gets.strip
    while input != "exit"

        if input.to_i-1 <= JAZZNOW::Events.all.size
          event = JAZZNOW::Events.all[input.to_i-1]

          puts ""
          puts "Date: #{event.date}".bold
          puts event.city.bold.red
          puts "Venue: #{event.venue}".bold

          puts ""
          puts "'list' -            to see events again."
          puts "'exit' -            to go listen to Country Music."
          puts "'open' -            to open in browser."

    input = gets.strip

        if input.downcase == "list"
        menu
        elsif input == "exit"
          exit
        elsif input == "open"
          JAZZNOW::Events.open_in_browser
        else
          puts "Sorry, no Country Music here. Please choose from list...".bold.yellow
          sleep 2
          puts ""
          list_events
        # end
        #   if input == "exit"
        #     break
          end
        end
      end
    end






end
