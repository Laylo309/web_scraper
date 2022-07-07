require 'kimurai'

class PostsSpider < Kimurai::Base
  @name = "posts_spider"
  @engine = :mechanize

  def self.process(url)
    @start_urls = [url]
    self.crawl!
  end


  def parse(response, url:, data: {})
    response.xpath("//div[@class='news']").each do |post|
      item = {}

      item[:title] = post.css('a.news__title')&.text&.squish

      Post.where(item).first_or_create
    end
  end
end