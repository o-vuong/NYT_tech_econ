class NewsRoom::News
    attr_accessor :article, :author, :link, :type, :description, :base_url
    
    def self.today
        self.scrape_news
    end

    def self.scrape_news
        news = []


        news << self.scrape_NYT_tech
        news << self.scrape_NYT_econ


        news
    end


    def self.scrape_NYT_tech


        doc = Nokogiri::HTML(open("https://www.nytimes.com/section/technology"))
        
        news = self.new  
        news.article = doc.at_css("h2.css-1dq8tca.e1xfvim30").text
        news.author = doc.at_css("p.css-1xonkmu").text
        news.base_url = "https://www.nytimes.com"
        news.link = doc.search("div.css-4jyr1y a").first.attr("href") 
        news.type = "Technology"
        news.description = doc.at_css("div.css-4jyr1y p.css-1echdzn.e1xfvim31").text
        
      
        news

        
    end

    def self.scrape_NYT_econ
        
        doc = Nokogiri::HTML(open("https://www.nytimes.com/section/business/economy"))

        news = self.new
        news.article = doc.at_css("h2.css-1dq8tca.e1xfvim30").text
        news.author = doc.at_css("p.css-1xonkmu").text
        news.base_url = "https://www.nytimes.com"
        news.link = doc.at_css("div.css-4jyr1y a").first.attr("href")
        news.type = "Economics"
        news.description = doc.at_css("div.css-4jyr1y p.css-1echdzn.e1xfvim31").text
        news
    end

end