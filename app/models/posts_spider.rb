require 'kimurai'

class PostsSpider < Kimurai::Base
  @name = "posts_spider"
  @engine = :mechanize

  def self.process(url)
    @start_urls = [url]
    self.crawl!
  end

  def parse(response, url:, data: {})
    doc = browser.current_response.css('div.wrapper main div.container div.single-layout').first

    big_news_container = doc.at('a.big-news')
    parse_big_news(big_news_container, url: url)



  end

  def parse_big_news(elem, url:)
    big_news = {
      title: elem.css('span.big-news__title')&.text&.squish,
      link: "#{url.split('/')[0]}//#{url.split('/')[2]}#{elem['href'].gsub(/\n/, '')}",
      created_time: elem.css('div.news-meta span')&.text&.squish
    }

    puts big_news
  end

  def parse_small_news(elem)
  end

  def parse_side_news(elem)
  end
end

puts PostsSpider.process('https://kun.uz/en/news/category/tech')