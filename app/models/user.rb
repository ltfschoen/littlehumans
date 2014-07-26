class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  has_many :rosters
  has_many :deliveries

  def self.find_for_facebook_oauth(auth, signed_in_resource = nil)
    user = UserHelper::OAuth::client_check_provider_and_uid(auth)

    # check for match between oauth parameter email and emails in the database
    registered_user = User.where(:email => auth.info.email).first

    # no further action if match found as user is already registered
    if registered_user
      return registered_user
    # register the oauth parameters in database if not already registered 
    else
      user = UserHelper::OAuth::client_facebook_register_user(auth)
    end 
  end

  def self.find_for_twitter_oauth(auth, signed_in_resource = nil)
    user = UserHelper::OAuth::client_check_provider_and_uid(auth)

    # check for match between oauth parameter email and emails in the database
    registered_user = User.where(:email => auth.uid + "@twitter.com").first

    # no further action if match found as user is already registered
    if registered_user
      return registered_user
    # register the oauth parameters in database if not already registered 
    else
      user = UserHelper::OAuth::client_twitter_register_user(auth)
    end
  end

  def self.find_for_google_oauth2(auth, signed_in_resource = nil)
    user = UserHelper::OAuth::client_check_provider_and_uid(auth)

    # check for match between oauth parameter email and emails in the database
    registered_user = User.where(:email => auth.info.email).first

    # no further action if match found as user is already registered
    if registered_user
      return registered_user
    # register the oauth parameters in database if not already registered 
    else
      user = UserHelper::OAuth::client_google_register_user(auth)
    end
  end
end
