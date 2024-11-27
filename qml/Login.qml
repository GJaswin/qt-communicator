import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    id : app
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
        id: mainPage
        anchors.fill: parent
        color: "white"
        border.color: "#d3d3d3"

        Text {
            id: welcome_main
            text: "Hello Yeagarist"
            font.family: "Product Sans Regular"
            font.pixelSize: 32
            font.bold: true
            color: "black"
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.leftMargin: 130
            anchors.topMargin: 120
        }

        Button {
            id: loginButton_main
            text: "Login"
            font.family: "Product Sans Regular"
            width: 300
            height: 40
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 250

            background: Rectangle {
                color: "#0078D7"
                radius: 5
            }
            font.pixelSize: 16

            onClicked: {
                mainPage.visible = false
                loginPage.visible = true
            }
        }

        Button {
            id: signupButton
            text: "SignUp"
            font.family: "Product Sans Regular"
            width: 300
            height: 40
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 330

            background: Rectangle {
                color: "#0078D7"
                radius: 5
            }
            font.pixelSize: 16

            onClicked: {
                mainPage.visible = false
                signup_page.visible = true
            }
        }

    }

    Rectangle {
        id: loginPage
        anchors.fill: parent
        color: "white"
        border.color: "#d3d3d3"
        visible: false

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

                signup_page.visible = true
                mainPage.visible = false
            }
        }

    }

    Button {
        text: "Back"
        width : 60
        height : 40
        font.family: productsans.name
        font.pixelSize: 16
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top : parent.top
        anchors.topMargin: 450
        anchors.left : parent.left
        anchors.leftMargin: 100
        background: Rectangle {
            color: "#fff"
            radius: 6
            border.color: "#ccc"
            border.width: 1
        }

        onClicked: {
                    loginPage.visible = false
                    mainPage.visible = true
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

    Rectangle {
        id: signup_page
        anchors.fill: parent
        color: "white"
        border.color: "#d3d3d3"
        visible: false

    Text {

            text: "Sign Up to QT Communicator"
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

            text: "Already have an account?"
            font.family: productsans.name
            font.pixelSize: 15
            color: "grey"
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.leftMargin: 130
            anchors.topMargin: 420
        }

    Text {
        text: "Log In "
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

                signup_page.visible = false
                loginPage.visible = true
            }
        }

    }

    Button {
        text: "Back"
        width : 60
        height : 40
        font.family: productsans.name
        font.pixelSize: 16
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top : parent.top
        anchors.topMargin: 450
        anchors.left : parent.left
        anchors.leftMargin: 100
        background: Rectangle {
            color: "#fff"
            radius: 6
            border.color: "#ccc"
            border.width: 1
        }

        onClicked: {
                    signup_page.visible = false
                    mainPage.visible = true
                }
        }

        Column {
            anchors.centerIn: parent
            spacing: 20
            width: parent.width * 0.8

            TextField {

                placeholderText : "  Email address"
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

            TextField {

                placeholderText: "  Repeat Password"
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

            Button {

                text: "Sign In"
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




