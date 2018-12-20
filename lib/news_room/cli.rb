class NewsRoom::CLI
    
    def call 
        list_news
        menu
        goodbye
    end

    def list_news
        puts "Today's news:"
        @news = NewsRoom::News.today
        @news.each.with_index(1) do |news, i| 
        puts "#{i}.  #{news.article} - #{news.author} - #{news.link} - #{news.type}"        
        end
        
    end
        
        
    
    
    def menu
        input = nil
        while input != "exit"
            puts "Input number of which article you'd like to read, type list to see articles again or type exit to exit:"
            input = gets.strip.downcase
            if input.to_i > 0
                the_news = @news[input.to_i-1]
               puts "#{the_news.description.split}"
                elsif input == "list"
                    list_news
                else 
                    puts "Check again later to see the latest! If you want to go back and read more type list. If you're finished type exit."              
            end
        end
    end


    def goodbye
        puts "Exiting..."
    end
end