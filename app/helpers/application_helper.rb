module ApplicationHelper
  
  include Twitter::Autolink # allows twitter-text gem to work. also added to users_controller.rb

  # include so available to all views
  # http://stackoverflow.com/questions/6887319/common-method-in-model-and-helper
  include ClientTwitter
  include ClientGoogle
  include ClientGoogleCalendar

end
