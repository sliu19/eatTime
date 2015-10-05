function createUser(info) {
	var user = new Parse.User();
	//required field
	user.set("username", info.username);
	user.set("password", info.password);
	user.set("email",info.email);
	//otherFields
	user.set("gender",info.gender);

	user.signUp(null, {
		success: function(user) {
			//Continue use the app
		},
		error: function(user, error) {
			alert("Error in sign up:" + error.code + " " + error.message);
		}
	});
}
	
function logIn(info) {
	Parse.User.logIn(info.username, info.password, {
		success: function(user) {
			//Continue use the app
		},
		error: function(user,error) {
			alert("Error in logIn:" + error.code + " " + error.message);
		}
	});
}

function logOut() {
	Parse.User.logOut();
}