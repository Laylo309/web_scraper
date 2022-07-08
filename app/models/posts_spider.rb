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
      item[:link] = "#{url.split('/')[0]}//#{url.split('/')[2]}#{post.css('a.news__title').attribute('href').text&.squish}"
      item[:created_time] = post.css('div.news-meta span')&.text&.squish

      begin
        Post.create(item)
      rescue => exception
        puts exception
      end
    end
  end
end