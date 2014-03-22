# causes CSRF error for google, as already included in initializers/devise.rb

# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
#   provider :facebook, ENV['FACEBOOK_ID'], ENV['FACEBOOK_SECRET']
#   provider :google_oauth2, ENV['GOOGLE_KEY'], ENV['GOOGLE_SECRET'], { access_type: "offline", approval_prompt: "" }
# end