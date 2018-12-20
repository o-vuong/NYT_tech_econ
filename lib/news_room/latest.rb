class NewsRoom::News
    attr_accessor :article, :author, :link, :type, :description

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
        news.article = doc.search("h2.css-1dq8tca.e1xfvim30")[0].text
        news.author = doc.search("p.css-1xonkmu")[0].text
        news.link = doc.search("div.css-4jyr1y a").first.attr("href") 
        news.type = "Technology"
        news.description = doc.search("div.css-4jyr1y p.css-1echdzn.e1xfvim31").text
        
      
        news

        
    end

    def self.scrape_NYT_econ
        
        doc = Nokogiri::HTML(open("https://www.nytimes.com/section/business/economy"))

        news = self.new
        news.article = doc.search("h2.css-1dq8tca.e1xfvim30")[0].text
        news.author = doc.search("p.css-1xonkmu")[0].text
        news.link = doc.search("div.css-4jyr1y a").first.attr("href")
        news.type = "Economics"
        news.description = doc.search("div.css-4jyr1y p.css-1echdzn.e1xfvim31").text
        news
    end

end