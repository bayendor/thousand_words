class TweetsController < ApplicationController

  def index
    @feed = feed
  end

  def feed(term='#ruby', count=5)
    @tweets = Tweet.feed.search(term).take(count)
  end

  def image_feed(tweets)
    @images = tweets.with_images
  end

  def new
  end

  def create
    current_user.tweet(twitter_params[:message])
  end

  def twitter_params
    params.require(:tweet).permit(:message)
  end

  private

  def with_images
    self.select { |tweet| tweet.media.any? }
  end
end
