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


                // Make the Firestore request to save username
                // var xhrFirestore = new XMLHttpRequest();
                // const firestoreApiUrl = `https://firestore.googleapis.com/v1/projects/qt-communicator/databases/(default)/documents/users/${uid}`;
                // var firestoreData = {
                //     fields: {
                //         username: {
                //             stringValue: username,
                //         },
                //     },
                // };

                // xhrFirestore.open("PATCH", firestoreApiUrl, true);
                // xhrFirestore.setRequestHeader("Authorization", `Bearer ${idToken}`);
                // xhrFirestore.setRequestHeader("Content-Type", "application/json");
                // xhrFirestore.onreadystatechange = function () {
                //     if (xhrFirestore.readyState === XMLHttpRequest.DONE) {
                //         if (xhrFirestore.status === 200) {
                //             console.log("Username set successfully in Firestore");
                //         } else {
                //             console.error("Error setting username in Firestore:", xhrFirestore.responseText);
                //         }
                //     }
                // };
                // xhrFirestore.send(JSON.stringify(firestoreData));
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
            callback(response);
            // var idToken = response.idToken;
            // var uid = response.localId;
            // var user_email = response.email;
        }
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
