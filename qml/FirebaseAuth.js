// FirebaseAuth.js
Qt.include("apikey.js")
var apiKey = apikey;

function signUp(username, email, password, callback) {
    var xhrSignUp = new XMLHttpRequest();
    var url = `https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=${apiKey}`;
    var signUpData = {
        displayName: username,
        email: email,
        password: password,
        returnSecureToken: true,
    };

    xhrSignUp.open("POST", url);
    xhrSignUp.setRequestHeader("Content-Type", "application/json");
    xhrSignUp.onreadystatechange = function () {
        if (xhrSignUp.readyState === XMLHttpRequest.DONE) {
            var response = JSON.parse(xhrSignUp.responseText);

            if (xhrSignUp.status === 200) {
                  // Callback with signup response
                callback(response);

               var idToken = response.idToken;
                var uid = response.localId;
            } else {
                console.error("Error during signup:", response.error.message);
                callback(response);
            }
        }
    };
    xhrSignUp.send(JSON.stringify(signUpData));
}

function login(email, password, callback) {
    var xhr = new XMLHttpRequest();
    var url = `https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=${apiKey}`;
    var data = {
        email: email,
        password: password,
        returnSecureToken: true,
    };

    xhr.open("POST", url);
    xhr.setRequestHeader("Content-Type", "application/json");
    xhr.onreadystatechange = function () {
        if (xhr.readyState === XMLHttpRequest.DONE) {
            var response = JSON.parse(xhr.responseText);
            callback(response);        }
    };
    xhr.send(JSON.stringify(data));

}

function getUserData(idToken, callback) {
    var xhr = new XMLHttpRequest();
    var url = `https://identitytoolkit.googleapis.com/v1/accounts:lookup?key=${apiKey}`;
    xhr.open("POST", url);
    xhr.setRequestHeader("Content-Type", "application/json");
    xhr.onreadystatechange = function () {
        if (xhr.readyState === XMLHttpRequest.DONE) {
            var response = JSON.parse(xhr.responseText);
            if (xhr.status === 200) {
                callback(response);
            } else {
                console.error("Error retrieving user data:", response.error.message);
                callback(null, response.error.message);
            }
        }
    };
    xhr.send(JSON.stringify(data));
}
