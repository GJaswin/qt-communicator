import QtQuick
import QtQuick.Controls
import "FirebaseAuth.js" as FirebaseAuth


ApplicationWindow {
    id : root
    visible: true
    width: 700
    height: 400
    title: "Settings"
    FontLoader {
        id: productsans
        source: "qrc:/res/fonts/Product Sans Bold Italic.ttf"

    }

    Rectangle {
        anchors.fill: parent
        color: "#2e3136"

        // Sidebar for User Settings
        Rectangle {
            id: sidebar
            width: 250
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            color: "#202225"

            Column {
                anchors.fill: parent
                spacing: 20
                padding: 20

                Text {
                    text: "USER SETTINGS"
                    color: "white"
                    font.pixelSize: 18
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.family: productsans.name
                }

                ListView {
                    id: menuList
                    width: parent.width
                    height: parent.height - 100
                    anchors.horizontalCenter: parent.horizontalCenter
                    model: ["My Account", "About"]
                    delegate: Item {
                        width: parent.width
                        height: 40
                        Rectangle {
                            width: parent.width
                            height: 40
                            color: "#2f353b"
                            radius: 2
                            border.color: "#444c56"
                            border.width: 1

                            MouseArea {

                                anchors.fill: parent
                                onClicked: {

                                    if (modelData === "My Account") {
                                        userContent.visible = true
                                    } else if (modelData === "About") {
                                        var secondPage = Qt.createComponent("About.qml").createObject(null, {});
                                        secondPage.show();
                                    }
                                }

                                cursorShape: Qt.PointingHandCursor

                            }

                            // Text label for the menu item
                            Text {
                                id: itemArea
                                text: modelData
                                color: "#b9bbbe"
                                font.pixelSize: 16
                                anchors.centerIn: parent
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                font.family: productsans.name
                            }
                        }
                    }
                }

            }
        }

        // Main Profile Section
        Rectangle {

            id: userContent
            visible:false
            anchors.left: sidebar.right
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            color: "#36393f"
            property string username: FirebaseAuth.uid
            property string email: FirebaseAuth.user_email


            Dialog {
                id: editProfileDialog
                title: "Edit Profile"
                modal: true
                width: 400
                height: 200
                anchors.centerIn: parent
                font.family: productsans.name


                contentItem: Column {
                    width: parent.width
                    spacing: 10

                    // Username Input Field
                    TextField {
                        id: usernameInput
                        font.family: productsans.name
                        placeholderText: "Enter Username"
                        width: parent.width
                        text: userContent.username // Bind to username property
                    }

                    // Email Input Field
                    TextField {
                        id: emailInput
                        font.family: productsans.name
                        placeholderText: "Enter Email"
                        width: parent.width
                        text: userContent.email // Bind to email property
                    }

                    // Save Button
                    Button {
                        text: "Save"
                        font.family: productsans.name
                        anchors.horizontalCenter: parent.horizontalCenter
                        onClicked: {
                            userContent.username = usernameInput.text
                            userContent.email = emailInput.text
                            editProfileDialog.close() // Close the dialog
                        }
                        background: Rectangle {
                            color: "lightgreen"
                            radius: 5

                        }

                    }

                    // Cancel Button
                    Button {
                        text: "Cancel"
                        font.family: productsans.name
                        background: Rectangle {
                            color: "#FF6262"
                            radius: 5

                        }


                        anchors.horizontalCenter: parent.horizontalCenter
                        onClicked: editProfileDialog.close()
                    }
                }
            }

            Column {
                anchors.fill: parent
                spacing: 20
                padding: 20



                // Profile Info Section
                Column {
                    id: profileInfo
                    spacing: 10
                    width: parent.width - 40
                    anchors.horizontalCenter: parent.horizontalCenter


                    Rectangle {
                        height: 60
                        width: parent.width
                        color: "#40444b"
                        radius: 8

                        Row {
                            anchors.centerIn: parent
                            spacing: 10
                            Text {
                                font.family: productsans.name
                                text: "USERNAME:  " + userContent.username
                                color: "#b9bbbe"
                                font.pixelSize: 16
                            }
                        }
                    }

                    Rectangle {
                        height: 60
                        width: parent.width
                        color: "#40444b"
                        radius: 8

                        Row {
                            anchors.centerIn: parent
                            spacing: 10
                            Text {
                                font.family: productsans.name
                                text: "EMAIL:  " +userContent.email
                                color: "#b9bbbe"
                                font.pixelSize: 16
                            }
                        }
                    }
                }

                // Edit Profile Button
                Row {
                    anchors.horizontalCenter: parent.horizontalCenter
                    spacing: 20
                    Button {
                        text: "Edit Profile"
                        font.family: productsans.name
                        width: 120
                        background: Rectangle {
                            color: "#0078D7"
                            radius: 5
                        }
                        onClicked: {
                            editProfileDialog.open() // Open the dialog when clicked
                        }

                    }


                    }
                }
            }
        }
    }

