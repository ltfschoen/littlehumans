class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  has_many :rosters
  has_many :deliveries
  
  # check if oauth matches an existing user otherwise register them
  def self.find_for_facebook_oauth(auth, signed_in_resource = nil)
    user = UserHelper::OAuth::client_check_provider_uid_email(auth)
  end

  def self.find_for_twitter_oauth(auth, signed_in_resource = nil)
    user = UserHelper::OAuth::client_check_provider_uid_email(auth)
  end

  def self.find_for_google_oauth2(auth, signed_in_resource = nil)
    user = UserHelper::OAuth::client_check_provider_uid_email(auth)
  end
end
