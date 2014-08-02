module ClientGoogleCalendar
  
  def self.client_google_calendar()
    
    require 'rubygems'
    require 'google_calendar'

    cal = Google::Calendar.new(:username => ENV['G_USER'],
                           :password => ENV['G_PASS'],
                           :app_name => 'Littlehumans',
                           :calendar => 'm88eksashs23rt5r00ji2vpn2g@group.calendar.google.com')
  end

end