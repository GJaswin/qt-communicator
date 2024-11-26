import QtQuick
import QtQuick.Controls

ApplicationWindow {
    visible: true
    width: 500
    height: 600
    title: "QT Cmmunicator"

    FontLoader {
        id: productsans
        source: "res/font/Product Sans Regular.ttf"
    }

    Rectangle {
        id: loginPage
        anchors.fill: parent
        color: "white" // Background color
        border.color: "#d3d3d3"

        Column {
            anchors.centerIn: parent
            spacing: 20
            width: parent.width * 0.8

            Text {
                id : welcome
                text: "Welcome Back Yeagarist"
                font.family: productsans.name
                font.pixelSize: 32
                font.bold: true
                horizontalAlignment: Text.AlignTop
                anchors.horizontalCenter: parent.horizontalCenter
                color: "black"
            }

            TextField {
                id: usernameField
                placeholderText : "Username"
                placeholderTextColor: "#888"
                width: parent.width
                height: 40
                font.pixelSize: 16
                color: "#000"
                background: Rectangle {
                    color: "#fff"
                    radius: 5
                    border.color: "#ccc"
                    border.width: 1
                }
            }

            TextField {
                id: passwordField
                placeholderText: "Password"
                placeholderTextColor: "#888"
                echoMode: TextInput.Password
                width: parent.width
                height: 40
                font.pixelSize: 16
                color: "#000"
                background: Rectangle {
                    color: "#fff"
                    radius: 5
                    border.color: "#ccc"
                    border.width: 1
                }
            }

            Button {
                id: loginButton
                text: "Login"
                font.family: productsans.name
                width: parent.width
                height: 40
                background: Rectangle {
                    color: "#0078D7"
                    radius: 5
                }
                font.pixelSize: 16
                onClicked: {
                    welcome.color="blue"
                }
            }

            Text {
                text: "Forgot Password?"
                font.family: productsans.name
                font.pixelSize: 14
                font.underline: true
                color: "#0078D7"
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        welcome.text="ohh sadd!!"
                    }
                }
            }

            Item {
                height: 20
            }

            Text {
                text: "Sign Up "
                font.family: productsans.name
                font.pixelSize: 14
                font.underline: true
                color: "#0078D7"
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        welcome.text="okay"
                    }
                }

            }
        }
    }
}
