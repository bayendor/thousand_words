class TweetsController < ApplicationController

  def index
    @feed = feed
  end

  def feed(term='#ruby')
    @tweets = Tweet.feed.search(term).take(5)
  end

  def new
  end

  def create
    current_user.tweet(twitter_params[:message])
  end

  def twitter_params
    params.require(:tweet).permit(:message)
  end
end
