

	var fetchRoster = function (url) {
		
		var countHours = function(start, end){
			// sample of start is 2014-03-26T10:00:00+11:00
			// sample of end is 2014-03-26T10:30:00+11:00	
			console.log('start:' + start);
			console.log('end:' + end);
			// if not item[i].start.dateTime (i.e. all day events only have item[i].start.date )
			if (start === '' || end === '') { 
				return '1 day';
			} else {
				// sample if duration 2014-03-26T10:00:00+11:00
				// var regex = /[T]/; // regular expression to detect if contains the letter T
				// var day = regex.exec(start);
				// console.log(day)
				// // regex.exec returns ["T", index: 10, input: "2014-03-26T10:00:00+11:00"]
				// // if contains letter T which indicates it is not full day
				// if (day && day[0] === 'T') { 
				// 	return '1 day';
				// } else {

				var hours = 0;

				start = new Date(start.replace(/-/g,'/').replace(/[A-Z]/,' ').substr(0,19) );
				end = new Date(end.replace(/-/g,'/').replace(/[A-Z]/,' ').substr(0,19));
				hours = hours + ( end - start ) / ( 1000 * 60 * 60 );

				return (hours + ' hrs');
				// returns 0.5 hrs
			}; // if not start and end empty

		}; //function count hours

		// JSON of public calendar currently under test
		// https://www.googleapis.com/calendar/v3/calendars/m88eksashs23rt5r00ji2vpn2g@group.calendar.google.com/events?key=AIzaSyAY38OxGwCWsZZCyhRuaf4IpmxGSLUqTGg&access_token=733619507900-0h7r35475cpc7e0gckr943u6vmqund9c.apps.googleusercontent.com
		var addRoster = function(data) {
			$('#calendar-list').html(''); // reset DOM value to empty
			$('#calendar-list').html('<tr class="info"><td>Name</td><td>Shift</td><td>Dept</td><td>Location</td><td>Start</td><td>Finish</td><td>Duration</td><td>Status</td></tr>'); // reset each time loaded
			console.log(data);
			$(data.items).each(function() { 
				$('#calendar-list').append(
					// add cycle colours with bootstrap after figure how to escape char
					//'<tr class="' + cycle_class + '"><td>' + 
					'<tr class="active"><td>' + this.creator.displayName + 
					'</td><td>' + this.summary + 
					'</td><td>' + this.description.slice(0,20) + // max characters 21
					'</td><td>' + this.location.split(",", 1) + // max characters 21
					// returns .date (if all day event), or .dateTime (if duration specified)
					'</td><td>' + (this.start.dateTime ? this.start.dateTime : this.start.date) +
					'</td><td>' + (this.end.dateTime ? this.end.dateTime : this.end.date) +
					'</td><td>' + countHours(this.start.dateTime ? this.start.dateTime : '', this.end.dateTime ? this.end.dateTime : '') +
					'</td><td><a onclick="updateRoster(' + "'" + this.id  + "'" + ');" id="' + this.id + '">' + this.status + '</a></td></tr>'
				);
			});  // each data item
		}; // addRoster

		// ajax request for google calendar via calendar method in users controller
		// purpose is alternative to direct ajax request that reveals google security keys
		var options = {
		  url: '/users/calendar?filter=get', 
		  type: 'get',
		  dataType: 'json'
		};

	    $.ajax(options).done(function(calendar) {
		  console.log('ajax calendar success');
		  console.log(calendar);
		  // after get calendar from controller server side
		}).done(function(calendar_data) { // success handler
			console.log("data is: " + calendar_data);
			addRoster(calendar_data);
			//setTimeout(loadGoogleAPI, 1000); // schedule next request after 5s
		}).error(function(calendar_data) { // failure handler
			console.log("error is: " + calendar_data);
		});

	};

	// loads OAuth2 to allow connection to Google APIs (i.e. Google Calendar)
	function loadGoogleAPI() {
		$('#exchange-main').hide();
		$('#exchange-search').hide();
		$('#exchange-roster').show();
		fetchRoster();
	};

    // prevent click showing all pages
	$('#roster').on('click', function(event) {
		event.preventDefault();
		$('#exchange-search').hide();
		$('#exchange-main').hide();
		$('#exchange-roster').show();
		fetchRoster();
	});

	// UPDATE CALENDAR POST WITH STATUS OF COMPLETE

	var updateRoster = function (url) {
		
		var updateRosterCancelled = function(data) {
			console.log("in addRoster with data: " + data);

		};
	
		var new_status = "cancelled";

		var options = {
		  url: '/users/calendar?filter=post&new_status=' + new_status, 
		  type: 'post', // http post request is performed in controller
		  dataType: 'json',
		  data: { status: "cancelled" }
		  			/*end: { dateTime: "2015-07-22T11:30:00-07:00" }
                        , status: "cancelled"
                        , colorID: "rgb(150, 100, 100)"
                    }*/
		}; // options

	    $.ajax(options).done(function(calendar) {
		  console.log('ajax update calendar success');
		  console.log(calendar);
		  // after get calendar from controller server side
		}).done(function(calendar_data) { // success handler
			console.log("data is: " + calendar_data);
			updateRosterCancelled(calendar_data);
		}).error(function(calendar_data) { // failure handler
			console.log("error is: " + calendar_data);
		}); // ajax etc

	}; // updateRoster
