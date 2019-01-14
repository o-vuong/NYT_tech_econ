class NewsRoom::News
    attr_accessor :article, :author, :link, :type, :description, :base_url, :section
    @@all = []
    def initialize(article = "", author = "", link = "", type = "", description = "", base_url = "", section = "")
        @article = article
        @author = author
        @link = link
        @type = type
        @description = description
        @base_url = base_url
        @section = section
    
        
    end

    def add_to_all
        @@all << self
    end

    def self.today
        self.scrape_news
        
    end


    def self.all
        @@all
        
    end

    def self.scrape_news
        
        self.scrape_NYT_tech
        self.scrape_NYT_econ
    end


    def self.get_articles
        @@all.to_set.each.with_index(1) do |news, i|
        puts " #{i}.#{news.article} - #{news.author} - #{news.base_url}#{news.link} - #{news.type}"  
       
        end  
       
    end


 


    def self.scrape_NYT_tech


        doc = Nokogiri::HTML(open("https://www.nytimes.com/section/technology"))
        
        news = NewsRoom::News.new()
        news.article = doc.at_css("h2.css-1dq8tca.e1xfvim30").text
        news.author = doc.at_css("p.css-1xonkmu").text
        news.base_url = "https://www.nytimes.com"
        news.link = doc.search("div.css-4jyr1y a").first.attr("href") 
        news.type = doc.at_css("h1.css-1qq4zod.e1bbdwbz0").text
        news.description = doc.at_css("div.css-4jyr1y p.css-1echdzn.e1xfvim31").text
        news.section = "https://www.nytimes.com/section/technology"
        news.add_to_all

    end

    def self.scrape_NYT_econ
    
        doc = Nokogiri::HTML(open("https://www.nytimes.com/section/business/economy"))

        news = NewsRoom::News.new()
        news.article = doc.at_css("h2.css-1dq8tca.e1xfvim30").text
        news.author = doc.at_css("p.css-1xonkmu").text
        news.base_url = "https://www.nytimes.com"
        news.link = doc.search("div.css-4jyr1y a").first.attr("href")
        news.type = doc.at_css("h1.css-1qq4zod.e1bbdwbz0").text
        news.description = doc.at_css("div.css-4jyr1y p.css-1echdzn.e1xfvim31").text
        news.add_to_all
    end
# binding.pry

end

