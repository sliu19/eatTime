//Events Module
/**
* ETevent: 	date: Creation date
*		 	time: Preferrable time slot
*		 	owner: Ownerid
*		 	applicant: Pid who applied
*		 	attendance: Pid who get accepted
*/
function ETevent(info) {
	this.date = info.date;
	this.owner = info.pid;
}

ETevent.prototype.foo = function() {
	alert("empty foo");
};

function newEvent(info) {
	var ETevent = Parse.Object.extend(info.date);
	ETevent.set("location", info.location);
	ETevent.save(null, {
		success: function(ETevent) {
			//Saved
		},
		error: function(ETevent, error) {
			alert('Failed to create new object, with error code: ' + error.message);
		}
	})
}

/**
* Input: pid: User id
*		 date: Table date
*		 optional: Array fo strings  of location
*		 optional: gender
* Output: Array of eligiable events
*/
function getFeed(info) {
	var eventFeed = Parse.Object.extend(info.date);
	var query = new Parse.Query(eventFeed);
	query.equalTo("location",info.location)；
	query.find({
		success: function(results) {
			alert("Successfully retrieved " + results.length + " events.");
    		// Do something with the returned Parse.Object values
    		return results;
    	},
    	error: function(error) {
    		alert("Error:" + error.code + " " + error.message);
    	}
	});
}

/**
* Input: pid: User
*		 date: Table date
*		 eid: Event id
* Result: Save user as the applicant	
*/
function applyMeal(info) {
	var ETevent = Parse.Object.extend(info.date);
	var query = new Parse.Query(ETevent);
	query.get(info.eid, {
  		success: function(ETevent) {
    		// The object was retrieved successfully.
    		var applicants = ETevent.get("applicant");
    		applicants.push(info.pid);
    		ETevent.set("applicant",applicants);
    		//TO DO: Send notification if someone applied
    		ETevent.save();
  		},
  		error: function(object, error) {
    	// The object was not retrieved successfully.
    	// error is a Parse.Error with an error code and message.
    	alert("Error:" + error.code + " " + error.message);
  		}
	});
}

/**
* Input: ownerid: Event Owner pid
*		 attandanceid: Accepted pid
*		 date: Table date
*		 eid: Event id
* Result: Accept user as the attandance	
*/
function accpetEatMate(info) {
	var ETevent = Parse.Object.extend(info.date);
	var query = new Parse.Query(ETevent);
	query.get(info.eid, {
  		success: function(ETevent) {
    		// The object was retrieved successfully.
    		var attandances = ETevent.get("attendance");
    		//TO DO: Check if it is the correct ownerid
    		attandances.push(info.attandanceid);
    		ETevent.set("attendance",attandances);
    		ETevent.save();
  		},
  		error: function(object, error) {
    	// The object was not retrieved successfully.
    	// error is a Parse.Error with an error code and message.
    	alert("Error:" + error.code + " " + error.message);
  		}
	});
}




