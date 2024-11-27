import QtQuick
import QtQuick.Controls

ApplicationWindow {
    visible: true
    width: 500
    height: 600
    title: "QT Cmmunicator"
    flags: Qt.WindowMinimizeButtonHint | Qt.WindowCloseButtonHint
    maximumWidth: 800
    maximumHeight: 600
    minimumWidth: 800
    minimumHeight: 600

    FontLoader {
        id: productsans
        source: "res/font/Product Sans Regular.ttf"
    }

    Rectangle {
        id: loginPage
        anchors.fill: parent
        color: "white" // Background color
        border.color: "#d3d3d3"

    Text {
            id: welcome
            text: "Welcome Back Yeagarist"
            font.family: productsans.name
            font.pixelSize: 32
            font.bold: true
            color: "black"
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.leftMargin: 55
            anchors.topMargin: 70
        }
    Text {
            id: enterdetails
            text: "Please enter your details"
            font.family: productsans.name
            font.pixelSize: 20
            color: "grey"
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.leftMargin: 55
            anchors.topMargin: 120
        }

    Text {

            text: "Don't have an account?"
            font.family: productsans.name
            font.pixelSize: 15
            color: "grey"
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.leftMargin: 150
            anchors.topMargin: 420
        }

    Text {
        text: "Forgot Password"
        font.family: productsans.name
        font.pixelSize: 14
        font.underline: true
        color: "#0078D7"
        anchors.top: parent.top
        anchors.topMargin : 320
        anchors.left: parent.left
        anchors.leftMargin: 330


        MouseArea {
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            onClicked: {
                welcome.text="ohh sadd!!"
            }
        }
    }

    Text {
        text: "Sign Up "
        font.family: productsans.name
        font.pixelSize: 14
        font.underline: true
        color: "#0078D7"
        anchors.top: parent.top
        anchors.topMargin : 420
        anchors.left: parent.left
        anchors.leftMargin: 310
        MouseArea {
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            onClicked: {
                welcome.text="okay"
            }
        }

    }

        Column {
            anchors.centerIn: parent
            spacing: 20
            width: parent.width * 0.8

            TextField {
                id: usernameField
                placeholderText : "  Username"
                placeholderTextColor: "#888"
                font.family: productsans.name
                width: parent.width
                height: 40
                font.pixelSize: 16
                color: "#000"
                background: Rectangle {
                    color: "#fff"
                    radius: 6
                    border.color: "#ccc"
                    border.width: 1
                }
            }

            TextField {
                id: passwordField
                placeholderText: "  Password"
                font.family: productsans.name
                placeholderTextColor: "#888"
                echoMode: TextInput.Password
                width: parent.width
                height: 40
                font.pixelSize: 16
                color: "#000"
                background: Rectangle {
                    color: "#fff"
                    radius: 6
                    border.color: "#ccc"
                    border.width: 1
                }
            }
            Rectangle {
                height: 20
                width: 1
                color: "transparent"
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

        }
    }
}
