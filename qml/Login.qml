import QtQuick
import QtQuick.Controls
import "FirebaseAuth.js" as FirebaseAuth
import "userData.js" as UserData

Item {
    id : root
    property bool passwordVisible: false
    signal loginsuccess()
    visible: true
    anchors {
        top: parent.top
        horizontalCenter: parent.horizontalCenter
    }

    FontLoader {
        id: productsans
        source: "qrc:/res/fonts/ProductSansRegular.ttf"

    }

    Rectangle {
        id: mainPage
        anchors.fill: parent
        anchors.horizontalCenter: parent.horizontalCenter
        color: "#232323"

        Image{
            width : mainPage.width
            height : mainPage.height
            fillMode : Image.PreserveAspectCrop
            clip: true
        }

        Text {
            id: welcome_main
            text: "Hello!"
            font.family: productsans.name
            font.pixelSize: 36
            font.bold: true
            color: "white"
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 120
        }

        Button {
            id: loginButton_main
            text: "Login"
            font.family: productsans.name
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
            font.family: productsans.name
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
        anchors.horizontalCenter: parent.horizontalCenter
        color: "white"
        border.color: "#d3d3d3"
        visible: false
        Item {
            id: image

            Image{
                width : 100
                height : 100
                source : "qrc:/res/image/erenyeager.jpg"
                fillMode : Image.PreserveAspectCrop
                clip: true
            }
            anchors.top: parent.top
            anchors.topMargin: 50
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.horizontalCenterOffset : -280

        }


        Text {
            id: welcome
            text: "Welcome Back "
            font.family: productsans.name
            font.pixelSize: 32
            font.bold: true
            color: "black"
            anchors.top: parent.top
            anchors.topMargin: 70
            anchors.horizontalCenter: parent.horizontalCenter

        }
        Text {
            id: enterdetails
            text: "Please enter your details"
            font.family: productsans.name
            font.pixelSize: 20
            color: "grey"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 120
        }

        Text {

            text: "Don't have an account?"
            font.family: productsans.name
            font.pixelSize: 15
            color: "grey"
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
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
            anchors.horizontalCenter: parent.horizontalCenter

            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: {
                    forgot_page.visible = true
                    mainPage.visible = false
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
            anchors.topMargin : 440
            // anchors.left: parent.left
            // anchors.leftMargin: 310
            anchors.horizontalCenter: parent.horizontalCenter
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
            id: login_backButton
            contentItem: Text {
                text: "Back"
                color: "#000"
                font.family: productsans.name
                font.pixelSize:16
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
            width : 400
            height : 40
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: parent.height * 0.8
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
                placeholderText : "  Email"
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
                echoMode: root.passwordVisible ? TextInput.Normal : TextInput.Password
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
                Button {
                    text: root.passwordVisible ? "🙈" : "👁️"
                    onClicked: {
                           root.passwordVisible = !root.passwordVisible
                       }
                       anchors.right: passwordField.right
                       anchors.rightMargin: 10
                       background: Rectangle {
                           color: "transparent"
                           border.width: 0
                       }
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
                    FirebaseAuth.login(usernameField.text, passwordField.text, function (response) {
                        if (response.error) {
                            console.log("Login Error: " + response.error.message);
                            enterdetails.text = "Invalid"
                        } else {
                            console.log("Login Successful! Token: " + response.idToken);
                            UserData.userDetails = response;
                            console.log(JSON.stringify(UserData.userDetails));
                            loginsuccess();
                        }
                    });

                }

            }
        }
    }

    Rectangle {
        id: signup_page
        anchors.fill: parent
        anchors.horizontalCenter: parent.horizontalCenter
        color: "white"
        border.color: "#d3d3d3"
        visible: false

        Text {
            id : signup_welcome
            text: "Sign Up to QT Communicator"
            font.family: productsans.name
            font.pixelSize: 32
            font.bold: true
            color: "black"
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 70
        }
        Text {

            id: signup_enterdetails
            text: "Please enter your details"
            font.family: productsans.name
            font.pixelSize: 20
            color: "grey"
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 120
        }

        Text {

            text: "Already have an account?"
            font.family: productsans.name
            font.pixelSize: 15
            color: "grey"
            anchors.top: parent.top
            anchors.topMargin: 420
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Text {
            text: "Log In "
            font.family: productsans.name
            font.pixelSize: 14
            font.underline: true
            color: "#0078D7"
            anchors.top: parent.top
            anchors.topMargin : 450
            anchors.horizontalCenter: parent.horizontalCenter
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
            id: signUp_backButton
            contentItem: Text {
                text: "Back"
                color: "#000"
                font.family: productsans.name
                font.pixelSize:16
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
            width : 400
            height : 40
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: parent.height * 0.8
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
                id: signup_username
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
                id: signup_email
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
                id: signup_password
                placeholderText: "  Password"
                font.family: productsans.name
                placeholderTextColor: "#888"
                echoMode: root.passwordVisible ? TextInput.Normal : TextInput.Password
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
                Button {
                    text: root.passwordVisible ? "🙈" : "👁️"
                    onClicked: {
                           root.passwordVisible = !root.passwordVisible
                       }
                       anchors.right: signup_password.right
                       anchors.rightMargin: 10
                       background: Rectangle {
                           color: "transparent"
                           border.width: 0
                       }
                   }
            }

            TextField {

                id: signup_repeatpassword
                placeholderText: "  Repeat Password"
                font.family: productsans.name
                placeholderTextColor: "#888"
                echoMode: root.passwordVisible ? TextInput.Normal : TextInput.Password
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
                Button {
                    text: root.passwordVisible ? "🙈" : "👁️"
                    onClicked: {
                           root.passwordVisible = !root.passwordVisible
                       }
                       anchors.right: signup_repeatpassword.right
                       anchors.rightMargin: 10
                       background: Rectangle {
                           color: "transparent"
                           border.width: 0
                       }
                   }
            }

            Button {

                text: "Sign Up"
                font.family: productsans.name
                width: parent.width
                height: 40

                background: Rectangle {
                    color: "#0078D7"
                    radius: 5

                }
                font.pixelSize: 16
                onClicked: {
                    if (signup_password.text == signup_repeatpassword.text) {
                        FirebaseAuth.signUp(signup_username.text, signup_email.text, signup_password.text, function (response) {
                            if (response.error) {
                                console.log("Sign Up Error: " + response.error.message);
                                signup_enterdetails.text = "Invalid!";
                            } else {
                                console.info("Sign Up Successful! Token: " + response.idToken);
                                UserData.userDetails = response;
                                console.log(response);
                                loginsuccess();
                            }
                        });

                    } else {
                        signup_enterdetails.text = "Password Mismatch!"
                    }

                }
            }
        }
    }
    Rectangle {
        id: forgot_page
        anchors.fill: parent
        anchors.horizontalCenter: parent.horizontalCenter
        color: "white"
        border.color: "#d3d3d3"
        visible: false

        Text {

            id: forgot_enterdetails
            text: "Password Reset"
            font.family: productsans.name
            font.pixelSize: 40
            font.bold : true
            color: "black"
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 100
        }

        Text {

            text: "Provide the email address associated with your account to recover your password."
            font.family: productsans.name
            font.pixelSize: 15
            color: "grey"
            anchors.top: parent.top
            anchors.topMargin: 160
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Text {
            text: "Log In "
            font.family: productsans.name
            font.pixelSize: 14
            font.underline: true
            color: "#0078D7"
            anchors.top: parent.top
            anchors.topMargin : 390
            anchors.horizontalCenter: parent.horizontalCenter
            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: {

                    forgot_page.visible = false
                    loginPage.visible = true
                }
            }
        }

        Button {
            id: forgot_backButton
            contentItem: Text {
                text: "Back"
                color: "#000"
                font.family: productsans.name
                font.pixelSize:16
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
            width : 400
            height : 40
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: parent.height * 0.7
            background: Rectangle {
                color: "#fff"
                radius: 6
                border.color: "#ccc"
                border.width: 1
            }

            onClicked: {
                forgot_page.visible = false
                mainPage.visible = true
            }
        }

        Column {
            anchors.centerIn: parent
            spacing: 20
            width: parent.width * 0.8

             TextField {
                id: forgot_email
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
                id: secret
                placeholderText : "  Secret Code"
                placeholderTextColor: "#888"
                font.family: productsans.name
                echoMode: root.passwordVisible ? TextInput.Normal : TextInput.Password
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
                Button {
                    text: root.passwordVisible ? "🙈" : "👁️"
                    onClicked: {
                           root.passwordVisible = !root.passwordVisible
                       }
                       anchors.right: secret.right
                       anchors.rightMargin: 10
                       background: Rectangle {
                           color: "transparent"
                           border.width: 0
                       }
                   }
            }

            Button {

                text: "Reset Password"
                font.family: productsans.name
                width: parent.width
                height: 40

                background: Rectangle {
                    color: "#0078D7"
                    radius: 5

                }
                font.pixelSize: 16
                onClicked: {
                    forgot_page.visible = false
                    reset_pass.visible = true


                }
            }
        }


    }
    Rectangle {
        id: reset_pass
        anchors.fill: parent
        anchors.horizontalCenter: parent.horizontalCenter
        color: "white"
        border.color: "#d3d3d3"
        visible: false

        Text {
            id : enter_newpass
            text: "Create New Password"
            font.family: productsans.name
            font.pixelSize: 32
            font.bold: true
            color: "black"
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 120
        }

        Button {
            id: reset_backButton
            contentItem: Text {
                text: "Back"
                color: "#000"
                font.family: productsans.name
                font.pixelSize:16
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
            width : 400
            height : 40
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: parent.height * 0.7
            background: Rectangle {
                color: "#fff"
                radius: 6
                border.color: "#ccc"
                border.width: 1
            }

            onClicked: {
                reset_pass.visible = false
                mainPage.visible = true
            }
        }

        Column {
            anchors.centerIn: parent
            spacing: 20
            width: parent.width * 0.8

            TextField {
                id: reset_password
                placeholderText: "  Password"
                font.family: productsans.name
                placeholderTextColor: "#888"
                echoMode: root.passwordVisible ? TextInput.Normal : TextInput.Password
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
                Button {
                    text: root.passwordVisible ? "🙈" : "👁️"
                    onClicked: {
                           root.passwordVisible = !root.passwordVisible
                       }
                       anchors.right: reset_password.right
                       anchors.rightMargin: 10
                       background: Rectangle {
                           color: "transparent"
                           border.width: 0
                       }
                   }
            }

            TextField {

                id: reset_repeatpassword
                placeholderText: "  Repeat Password"
                font.family: productsans.name
                placeholderTextColor: "#888"
                echoMode: root.passwordVisible ? TextInput.Normal : TextInput.Password
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
                Button {
                    text: root.passwordVisible ? "🙈" : "👁️"
                    onClicked: {
                           root.passwordVisible = !root.passwordVisible
                       }
                       anchors.right: reset_repeatpassword.right
                       anchors.rightMargin: 10
                       background: Rectangle {
                           color: "transparent"
                           border.width: 0
                       }
                   }
            }

            Button {

                text: "Reset Password"
                font.family: productsans.name
                width: parent.width
                height: 40

                background: Rectangle {
                    color: "#0078D7"
                    radius: 5

                }
                font.pixelSize: 16
                onClicked: {

                }
            }
        }
    }
}



