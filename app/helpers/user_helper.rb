module UserHelper
  module OAuth
    # check if user exists in database with provider and uid matching oauth parameter
    def self.client_check_provider_and_uid(auth)
      # grab user matching oauth parameter provider and user id from database
      user = User.where(:provider => auth.provider, :uid => auth.uid).first

      # no further action if match found
      if user
        return user
      end
    end

    # check if user exists in database with email matching oauth parameter
    def self.client_check_email(auth)
      # check for match between oauth parameter email and emails in the database
      registered_user = User.where(:email => auth.uid + "@twitter.com").first

      # no further action if match found as user is already registered
      if registered_user
        return registered_user
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
