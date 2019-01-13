class NewsRoom::CLI
    
    def call 
        list_news
        menu
        goodbye
    end

    def list_news
        puts "Today's news:"
        @news = NewsRoom::News
        @news.today
        @news.get_articles
        @news.all
        puts "Input number of which article you'd like to read, type list to see articles again or type exit to exit:"
        
    end
        
        
    
    
    def menu
        input = nil
        while input != "exit"
           
            input = gets.strip.downcase
            if (1..2).include?(input.to_i)
               the_news = @news=[input.to_i-1]
               puts "#{the_news.description}"
               puts "---------If you want to read the full article type open article to open section to view more news in #{the_news.type}---------"
               puts "-------------------To view articles again type list. If you are finished type exit to exit program----------------------"
               elsif input == "open section"
                    puts "opening browser..."
                    puts "-------------------To view articles again type list. If you are finished type exit to exit program----------------------"
                    Launchy.open("#{the_news.section}")
                elsif input == "open article"
                    puts "opening browser..."
                    puts "-------------------To view articles again type list. If you are finished type exit to exit program----------------------"
                    Launchy.open("#{the_news.base_url}#{the_news.link}")

                elsif input == "list"
                    list_news
                else 
                    puts "Check again later to see the latest! If you want to go back and read more type list. If you're finished type exit."              
            end
        end
    end
binding.pry

    def goodbye
        puts "Exiting..."
    end
end

