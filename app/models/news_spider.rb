require 'kimurai'

class NewsSpider < Kimurai::Base
  @name = "news_spider"
  @engine = :mechanize

  def self.process(url)
    @start_urls = [url]
    self.crawl!
  end


  def parse(response, url:, data: {})
    response.xpath("//div[@class='news']").each do |news|
      item{}
      item[:title] = news.css('a.news__title')&.text&.squish

      News.where(item).first_or_create
    end
  end
end