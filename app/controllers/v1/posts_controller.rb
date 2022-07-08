class V1::PostsController < ApplicationController
  protect_from_forgery with: :null_session
  # GET /posts or /posts.json
  def index
    @posts = Post.all
    render json: {posts: @posts}
  end

  def scrape
    url = 'https://kun.uz/en/news/category/tech'
    @response = PostsSpider.process(url)
    if @response[:status] == :completed && @response[:error].nil?
      flash.now[:notice] = 'Successfully scraped url'
    else
      flash.now[:alert] = @response[:error]
    end
  rescue StandardError => e
    flash.now[:alert] = 'Error: #{e}'
  end
end
