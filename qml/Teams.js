.pragma library
var teamsList = [];


// fetchTeams.js
function fetchTeams(qmlCallback) {
    const xhr = new XMLHttpRequest();
    const url = "https://firestore.googleapis.com/v1/projects/qt-communicator/databases/(default)/documents/teams";

    xhr.open("GET", url, true);
    xhr.onload = function () {
        if (xhr.status === 200) {
            const response = JSON.parse(xhr.responseText);
            const teams = response.documents.map(doc => ({
                name: doc.name.split("/").pop(), // Assuming a `name` field exists
            }));
            // Pass data back to QML
            qmlCallback(teams);
        } else {
            console.error("Failed to fetch teams:", xhr.responseText);
        }
    };
    xhr.onerror = function () {
        console.error("Network error while fetching teams.");
    };
    xhr.send();
}
