module ClientTwitter
  
  # http://stackoverflow.com/questions/9917610/how-to-use-modules-in-rails-application
  def self.client_twitter()
    @client = Twitter::REST::Client.new do |config| 
      config.consumer_key        = ENV["TWITTER_KEY"]
      config.consumer_secret     = ENV["TWITTER_SECRET"]
      config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
      config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
    end
  end

end