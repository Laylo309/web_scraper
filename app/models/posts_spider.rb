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
      puts item
      item[:title] = post.css('a.news__title')&.text&.squish
      item[:link] = post.css('div.news a').attribute["href"]&.text&.squish.gsub(/\n/, "")
      item[:created_time] = post.css('div.news-meta')&.text&.squish
      Post.where(item).first_or_create
    end
  end
end
# <div class="col-md-4 mb-25 l-item">
# 		                  	<div class="news"><a class="news__img" href="/en/news/2022/06/25/minister-of-itc-development-apple-representatives-discuss-introduction-of-5g-and-applepay-in-uzbekistan"><img src="https://storage.kun.uz/source/thumbnails/_medium/8/ROd1leiyXlUn5yFqLzPBTZGl2rGAihbU_medium.jpg"></a>
# 		                    <div class="news-meta"><span>09:50 / 25.06.2022</span></div><a class="news__title" href="/en/news/2022/06/25/minister-of-itc-development-apple-representatives-discuss-introduction-of-5g-and-applepay-in-uzbekistan">Minister of ITC Development, Apple representatives discuss introduction of 5G and ApplePay in Uzbekistan</a>
# 		                  </div>
# 		                </div>
puts PostsSpider.process('https://kun.uz/news/category/tehnologia')
