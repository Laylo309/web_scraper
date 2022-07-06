class NewsController < ApplicationController
  def index
  end

  def new 
  end

  def scrape
    url = 'https://kun.uz/news/category/tehnologia'
    response = NewsSpider.process(url)
    if response[:status] == :completed && response[:error].nil?
      flash.now[:notice] = "Successfully scraped url"
    else
      flash.now[:alert] = response[:error]
    end
  rescue StandardError => e
    flash.now[:alert] = "Error: #{e}"
  end

  def show
  end
end