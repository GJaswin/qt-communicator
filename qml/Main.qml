import QtQuick 2.15
import QtQuick.Controls 2.15

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
        color: "white"
        border.color: "#d3d3d3"

    Text {
            id: welcome
            text: "Hello Yeagarist"
            font.family: productsans.name
            font.pixelSize: 32
            font.bold: true
            color: "black"
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.leftMargin: 130
            anchors.topMargin: 120
        }
    Button {
        id: loginButton
        text: "Login"
        font.family: productsans.name
        width: 300
        height: 40
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.leftMargin: 80
        anchors.topMargin: 250

        background: Rectangle {
            color: "#0078D7"
            radius: 5

        }
        font.pixelSize: 16
        onClicked: {
           welcome.color="blue"
        }

    }
    Button {
        id: signupbutton
        text: "SignUp"
        font.family: productsans.name
        width: 300
        height: 40
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.leftMargin: 80
        anchors.topMargin: 330

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
