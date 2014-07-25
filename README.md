Application Name Overview
==============================================

Author:
Luke Schoen

About:
Littlehumans is one of the final student projects of the Web Development Immersive course Jan-Mar 2014 at General Assembly. Littlehumans is a portal for securely viewing the latest midwifery tweets, and to share and filter rosters and record deliveries for medical continuing development.

Purpose:
Medical professionals leading busy lives need a portal to stay up to date with the latest midwifery news, record and compare new deliveries, and collaboration portal for midwifes.

Key Features:
User can login with either Twitter, Facebook, or Google, create and filter deliveries, view team rosters on public Google Calendars, and view latest tweets from midwifery Twitter accounts.

Required Environment / Minimum Setup
----------------------------------------------

Recommended Installations & Versions:
 - Mac OSX (>=10.9.3)
 - Git (>=1.8.5.2)
 - Ruby (>=2.1.0)
 - Rails (>=4.0.2)
 - Postgres93 (>=9.3.1.0)
 - Git-Flow

Recommended Setup:
1) Open Spotlight, type "terminal", then press "enter" on keyboard
2) Type the following and press "enter": git clone https://github.com/ltfschoen/littlehumans.git
3) Check that Postgres93 is running on Port 5432
4) Type the following in sequence and press "enter" between each: 
     bundle exec rake db:create
     bundle exec rake db:migrate RAILS_ENV=development
     bundle install
     bundle update 
     echo RAILS_SECRET_KEY_BASE=`rake secret` >> .env
     echo DEVISE_SECRET_KEY=`rake secret` >> .env
5) Type the following and press "enter" to start the Rails local server at Port 3000: rails s
6) Open your Web Browser (i.e. Chrome, Safari, Mozilla, etc)
7) Type the following in as your Browser Address and press "enter": http://localhost:3000/

Notable Deviations
----------------------------------------------

- Minimal RSpec Testing

Accessing the Site
----------------------------------------------

http://littlehumans.herokuapp.com/

Configuration
----------------------------------------------

Contact Luke Schoen at:
	Twitter: @ltfschoen
	LinkedIn: http://www.linkedin.com/in/ltfschoen

Walkthrough / Smoke Test
----------------------------------------------

 Assuming you have completed the section of this README entitled "Required Environment / Minimal Setup" and are able to run the website on your localhost. Alternatively, go to the launched website at http://littlehumans.herokuapp.com/

 1) View General Information pages:

	- Click "Info" Button at the top of the website and a drop-down appears
	- Click either "Help", "About Us", or "Contact Us" 

 2) Sign-In

 	Option #1 - Existing Social Media Account Users
 	- Click the Button "Sign in with Twitter", "Sign in with Google Plus", or "Sign in with Facebook", to Sign In using your Existing Social Media account

 	Option #2 - Existing Littlehumans Users (Non-Social Media Account Users)
 	- Click the Button "Sign in with Login" OR
 	- Click "Account" at the top of the website and Click "Sign In" from the drop-down

 	Option #3 - New Littlehumans Users (Non-Social Media Account Users)
 	- Click the Button "New Registration" OR
 	- Click "Account" at the top of the website and Click "Sign Up" from the drop-down

 3) View Latest Midwifery News / Tweets 

 	Click the Button on the left labelled "Tweets" (this displays the latest 3 OFF tweets from 3 OFF pre-selected Twitter account holders who publish Midwifery news and information).

 4) View Births (Babies Delivered) by Users

 	Click the Button on the left labelled "Births" to be taken to the "Deliveries" section of the website (this displays Details of All Babies that any Registered Littlehumans User Account Holder has Created in this section of the website).

 	Create a New Baby (Delivery) yourself Pressing the green Button "Create", and then entering the baby details, and submitting it by Clicking "Update" in the next screen).

 	View only the Babies (Deliveries) that you created by Pressing the "My" Button.

 	View All Babies (Deliveries) that Any Littlehumans Account Holder has created by Pressing the "All" Button.

 	Return to the Main Menu by Pressing the "Back" Button.

 5) View Calendar Roster (Midwifery Work Roster)

 	Click the Button on the left labelled "Roster" to be taken to the "Calendar" section of the website (this displays All Calendar Events that any Registered Littlehumans User Account Holder has Created in using the public Google Calendar).

    Request access from @ltfschoen (the author) to get permission to access the public Google Calendar (if you want access to include new events on the public Google Calendar).

    Clicking the Ignore Button for an Event row will cause the Littlehumans website to ignore that Event and no longer display it in future (it will only retained on the Google Calendar itself)

Testing
----------------------------------------------

Methods: Test Driven Development, Git-Flow merges version control

1) View current RSpec Test Results by typing the following terminal and press "enter": 
     bundle exec rspec
2) View the SimpleCov Test Coverage Report by opening the following file in your Web Browser:
	./littlehumans_app/app/coverage/index.html

Staging Environment
----------------------------------------------

https://github.com/ltfschoen/littlehumans

Production Environment
----------------------------------------------

http://littlehumans.herokuapp.com/

Design / Development
----------------------------------------------

Tech Stack: Ruby on Rails 4.0, HTML5, CSS3, Sass, jQuery, Javascript, AJAX, PostgreSQL, OmniAuth2 (Twitter, Facebook, Google), HTTParty, RSpec, SimpleCov, Devise (Gem), Bootstrap, Twitter-Text(Gem), Google Calendar API, Pry, IRB, Logger, Developer Tools

Tools: PivotalTracker, Adobe Photoshop

Known Issues / Gotcha
----------------------------------------------

- Google Calendar Gem is used to GET a feed of all calender event entries from a public Google Calendar that has been setup specifically for this website (request permission from @ltfschoen for access). Each calendar event is displayed in the Roster section of the website. If the user clicks the "Ignore" button, then the ID of that calendar event will be entered into a PSQL database column, and when the Roster page is refreshed, that calendar event will no longer appear on Roster page of the website (it will only be retained on the Google Calendar itself). This functionality was working, however I have been informed that the ignore feature is no longer working.
- Google Calendar Gem for POST request purposes works, however the author did not realise it was actually working and creating new events when this site was first created. It was only created over the course of 1 week.
- Search Feature at the top of the website does not work (it has never been setup).

Extended Resources
----------------------------------------------

- Guide to Preparing a Default Readme https://github.com/reinteractive-open/default_readme