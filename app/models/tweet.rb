class Tweet < ActiveRecord::Base
  def self.feed
    Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['OMNIAUTH_PROVIDER_KEY']
      config.consumer_secret     = ENV['OMNIAUTH_PROVIDER_SECRET']
      config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
      config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
    end
  end
end

# def self.get_latest_new_year_resolution_tweets
#   search = Twitter::REST::Client.new
#   search.containing('new year resolution').result_type('recent').per_page(100).fetch.each do |tweet_results|
#     twitter_created_at = DateTime.parse(tweet_results.created_at)
#     unless Tweet.exists?(['twitter_created_at = ? AND from_user_id_str = ?', DateTime.parse(tweet_results.created_at), tweet_results.from_user_id_str])
#       Tweet.create!(
#       from_user: tweet_results.from_user,
#       from_user_id_str: tweet_results.from_user_id_str,
#       profile_image_url: tweet_results.profile_image_url,
#       text: tweet_results.text,
#       twitter_created_at: twitter_created_at
#       )
#     end
#   end
# end