class StaticPagesController < ApplicationController
  def home
    @feed = feed
  end

  def feed(term='#ruby')
    @tweets = Tweet.feed.search(term).take(5)
  end
end
