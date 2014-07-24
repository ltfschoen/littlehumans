class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:about_us, :contact_us, :privacy, :terms_and_cond, :help]  
  def about_us
  end

  def contact_us
  end

  def privacy
  end

  def terms_and_cond
  end

  def help
  end
end
