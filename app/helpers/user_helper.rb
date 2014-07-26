module UserHelper
  module OAuth
    # check if user exists in database with provider and uid matching oauth parameter
    def self.client_check_provider_uid_email(auth)
      # grab user matching oauth parameter provider and user id from database
      existing_user = User.where(:provider => auth.provider, :uid => auth.uid).first

      # no further action if match found
      if existing_user
        return existing_user
      else
        # check if user exists in database with email matching oauth parameter
        if auth.provider == "facebook"
          existing_user = User.where(:email => auth.info.email).first
        elsif auth.provider == "twitter"
          existing_user = User.where(:email => auth.uid + "@twitter.com").first
        elsif auth.provider == "google_oauth2"
          existing_user = User.where(:email => auth.info.email).first
        end
      end

      # no action if match found as user is already registered. otherwise register them
      if existing_user
        return existing_user
      else
        if auth.provider == "facebook"
          new_user = UserHelper::OAuth::client_facebook_register_user(auth)
        elsif auth.provider == "twitter"
          new_user = UserHelper::OAuth::client_twitter_register_user(auth)
        elsif auth.provider == "google_oauth2"
          new_user = UserHelper::OAuth::client_google_register_user(auth)
        end
      end
    end

    def self.client_facebook_register_user(auth)
      user = User.create(:name => auth.extra.raw_info.name,
                         :provider => auth.provider,
                         :uid => auth.uid,
                         :email => auth.info.email,
                         :password => Devise.friendly_token[0, 20]
                        )
    end

    def self.client_twitter_register_user(auth)
      user = User.create(:name => auth.info.name,
                         :provider => auth.provider,
                         :uid => auth.uid,
                         :email => auth.uid+"@twitter.com",
                         :password => Devise.friendly_token[0, 20]
                        )
    end

    def self.client_google_register_user(auth)
      user = User.create(:name => auth.info["name"],
                         :provider => auth.provider,
                         :email => auth.info["email"],
                         :uid => auth.uid,
                         :password => Devise.friendly_token[0, 20]
                        )
    end
  end
end
