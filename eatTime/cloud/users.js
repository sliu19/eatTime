//User Module

/**
* Retrive detail information about user
* Input: pid: User id
* Output: User object
*/
function getUser(pid) {
	var query = new Parse.Query(Parse.User);
	query.get(pid, {
  		success: function(user) {
    	// Do stuff
    		return user;
  		},
  		error: function(error) {
  			alert("Error:" + error.code + " " + error.message);
  		}
	});
}

function updateUserInfo(info) {

}

function matchScore(idA,idB) {

}