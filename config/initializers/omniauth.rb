Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']#'xM6ZPSHnhdNWPiW6fjgEw', 'hJD8HcLubCUu0DLMgkCDTGC3pKD0HlKDbAzKQbhBzc'
end