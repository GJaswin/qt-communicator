// FirebaseAuth.js
Qt.include("apikey.js")
var apiKey = apikey;

//User data
var idToken;
var uid;
var user_email;

function signUp(email, password, callback) {
    var xhr = new XMLHttpRequest();
    var url = `https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=${apiKey}`;
    var data = {
        email: email,
        password: password,
        returnSecureToken: true,
    };

    xhr.open("POST", url);
    xhr.setRequestHeader("Content-Type", "application/json");
    xhr.onreadystatechange = function () {
        if (xhr.readyState === XMLHttpRequest.DONE) {
            var response = JSON.parse(xhr.responseText);  // Parse response
            callback(response);
            idToken = response.idToken;
            uid = response.localId;
            user_email = response.email;
        }
    };
    xhr.send(JSON.stringify(data));
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
            idToken = response.idToken;
            uid = response.localId;
            user_email = response.email;
        }
    };
    xhr.send(JSON.stringify(data));
}


function setUsername(username) {
    const firestoreApiUrl = `https://firestore.googleapis.com/v1/projects/qt-communicator/databases/(default)/documents/users/${uid}`;

    const data = {
        fields: {
            username: {
                stringValue: username,
            },
        },
    };

    const xhr = new XMLHttpRequest();
    xhr.open("PATCH", firestoreApiUrl, true);
    xhr.setRequestHeader("Authorization", `Bearer ${idToken}`);
    xhr.setRequestHeader("Content-Type", "application/json");
    xhr.onreadystatechange = function() {
        if (xhr.readyState === XMLHttpRequest.DONE) {
            if (xhr.status === 200) {
                console.log('Username set successfully in Firestore');
            } else {
                console.error('Error setting username in Firestore:', xhr.responseText);
            }
        }
    };
    xhr.send(JSON.stringify(data));
}
