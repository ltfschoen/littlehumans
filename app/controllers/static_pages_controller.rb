class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:about_us, :contact_us, :privacy, :terms_and_cond, :help]  

end
