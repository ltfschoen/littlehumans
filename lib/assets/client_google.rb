module ClientGoogle
  
  def self.client_google()
    google_key = ENV["GOOGLE_KEY"] 
    google_simple = ENV["GOOGLE_SIMPLE"] # generate at https://code.google.com/apis/console/

    # generate from settings in google calendar 
    google_calendarid = "m88eksashs23rt5r00ji2vpn2g@group.calendar.google.com" 

    url = "https://www.googleapis.com/calendar/v3/calendars/#{google_calendarid}/events?key=#{google_simple}&access_token=#{google_key}"
    @url_resp = HTTParty.get(url)
  end

end