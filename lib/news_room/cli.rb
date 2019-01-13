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

        puts "Input number of which article you'd like to read, type list to see articles again or type exit to exit:"
        
    end
        
        
    
    
    def menu
        input = nil
        # binding.pry
        while input != "exit"
           
            input = (gets.strip.downcase.to_i - 1)
            if (0..1).include?(input)
                
               puts "#{@news.all[input].description}"
               puts "---------If you want to read the full article type open article to open section to view more news in #{@news.all[input].type}---------"
               puts "-------------------To view articles again type list. If you are finished type exit to exit program----------------------"
               elsif input == "open section"
                    puts "opening browser..."
                    puts "-------------------To view articles again type list. If you are finished type exit to exit program----------------------"
                    Launchy.open("#{@news.all[input].section}")
                elsif input == "open article"
                    puts "opening browser..."
                    puts "-------------------To view articles again type list. If you are finished type exit to exit program----------------------"
                    Launchy.open("#{@news.all[input].base_url}#{@news.all[input].link}")

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

