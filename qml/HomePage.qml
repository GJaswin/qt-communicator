import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import "FirebaseAuth.js" as FirebaseAuth
import "userData.js" as UserData

ApplicationWindow {
    id: window
    width: 900
    height: 500
    visible: true
    title: "QT Communicator"
    color: "#213131"
    FontLoader {
        id: productsans
        source: "qrc:/res/fonts/ProductSansRegular.ttf"

    }
    StackView {
        id: stackView
        anchors.fill: parent

    }
    SplitView {
        id: mainSplit
        height: parent.height * 0.9
        anchors.fill: parent
        handle: Rectangle {
            implicitWidth: 3
            implicitHeight: 3
            color: SplitHandle.pressed ? "#81e889"
                                       : (SplitHandle.hovered ? Qt.lighter("#c2f4c6", 1.1) : "#c2f4c6")
        }

        Rectangle {
            id: teams
            color: "#2e3136"
            SplitView.minimumWidth: parent.width * 0.3
            SplitView.preferredWidth: parent.width * 0.4
            SplitView.maximumWidth: parent.width * 0.9


            //left rectangle to hold icons
            Rectangle {
                id: leftBar
                width: 40
                height: teams.height
                border.width: 1
                border.color: "#36393f"
                color: "#36393f"
                opacity: 0.9
                anchors {
                    left: teams.left
                }

                Item{
                    id: info_icon

                    Image{

                        width : 35
                        height : 35
                        source : "qrc:/res/icons/info.png"
                        mipmap : true
                        fillMode : Image.PreserveAspectCrop
                        clip: true
                        asynchronous : true
                        smooth : true


                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                var secondPage = Qt.createComponent("About.qml").createObject(null, {});
                                secondPage.show();
                            }
                        }
                    }
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 50


                }

                Item{
                    id: setting_icon

                    Image{

                        width : 30
                        height : 30
                        source : "qrc:/res/icons/settings.png"
                        mipmap : true
                        fillMode : Image.PreserveAspectCrop
                        asynchronous : true
                        smooth : true

                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                var secondPage = Qt.createComponent("Settings.qml").createObject(null, {});
                                secondPage.show();
                            }
                        }
                    }
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 95
                    anchors.left :  parent.left
                    anchors.leftMargin : 5


                }

                // code to handle when account icon is pressed

                Popup {
                    id: accountsPopup
                    width: 300
                    height: 400
                    modal: true
                    focus: true
                    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside
                    background: Rectangle {
                        color: "#2C2F33"
                        radius: 10
                        border.color: "#7289DA"
                        border.width: 2
                    }
                    anchors.centerIn: mainSplit

                    contentItem: Column {
                        spacing: 20
                        padding: 15

                        Text {
                            text: "My Account"
                            font.pixelSize: 20
                            font.family: productsans.name
                            color: "#FFFFFF"
                            horizontalAlignment: Text.AlignHCenter
                            anchors.horizontalCenter: parent.horizontalCenter
                        }

                        ListView {
                            width: parent.width
                            height: 250
                            spacing: 10
                            anchors.top:parent.top
                            anchors.topMargin:200
                            anchors.horizontalCenter: parent.horizontalCenter
                            model: ListModel {
                                ListElement { name: "Username: " }
                                ListElement { name: "Email: " }

                            }

                            delegate: Rectangle {
                                width: parent.width
                                height: 50
                                color: "#7289DA"
                                radius: 5
                                border.color: "#99AAB5"
                                border.width: 1

                                Text {
                                    text: model.name
                                    anchors.centerIn: parent
                                    color: "#FFFFFF"
                                    font.family: productsans.name
                                }
                            }
                        }

                        Button {
                            text: "Close"
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.bottom:parent.bottom
                            anchors.bottomMargin:20
                            font.family: productsans.name
                            onClicked: accountsPopup.close()
                        }
                    }
                }

                Item{
                    id: acc_icon

                    Image{

                        width : 30
                        height : 30
                        source : "qrc:/res/icons/user.png"
                        mipmap : true
                        fillMode : Image.PreserveAspectCrop
                        asynchronous : true
                        smooth : true


                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                accountsPopup.open()
                            }
                        }
                    }
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 140
                    anchors.left :  parent.left
                    anchors.leftMargin : 5


                }

            }


            ColumnLayout {
                id: teamsColumn
                spacing: parent.height * 0.1
                height: parent.heightChanged
                anchors {
                    left: leftBar.right
                }

                Rectangle {
                    id: team_title
                    Layout.leftMargin: 10
                    Text {
                        text: "Teams"
                        font.pointSize: 20
                        font.weight: Font.Bold
                        font.family: productsans.name
                        color: "#4cc2ac"
                    }
                }

                Rectangle {

                    id: team_1
                    Layout.leftMargin: 10
                    Layout.topMargin: 30
                    color: "transparent"
                    radius: 10

                    Image {
                        id: icon_team_1
                        source: "qrc:/res/image/erencircle.png"
                        width: 50
                        height: 50
                        anchors.verticalCenter: parent.verticalCenter
                    }

                    Text {
                        id: name_team_1
                        text: "Team 1"
                        font.family: productsans.name
                        font.pointSize: 16
                        font.weight: Font.Bold
                        color: "#fff"
                        anchors {
                            left: icon_team_1.right
                            leftMargin: 20
                            verticalCenter: parent.verticalCenter
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                stackView.push("ChatPage.qml", {
                                    chatTitle: name_team_1.text
                                })
                            }
                            cursorShape: Qt.PointingHandCursor
                        }
                    }

                }


                Rectangle {
                    id: team_2
                    Layout.leftMargin: 10
                    Layout.topMargin: 30

                    Image {
                        id: icon_team_2
                        source: "qrc:/res/image/erencircle.png"
                        width: 50
                        height: 50
                        anchors.verticalCenter: parent.verticalCenter
                    }

                    Text {
                        id: name_team_2
                        text: "Team 2"
                        font.family: productsans.name
                        font.pointSize: 16
                        font.weight: Font.Bold
                        color: "#fff"
                        anchors {
                            left: icon_team_2.right
                            leftMargin: 20
                            verticalCenter: parent.verticalCenter
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                stackView.push("ChatPage.qml")

                            }
                            cursorShape: Qt.PointingHandCursor
                        }
                    }

                }
            }

        }

        Rectangle {
            id: friends
            color: "#36393f"
            SplitView.minimumWidth: parent.width * 0.1
            SplitView.preferredWidth: parent.width * 0.7
            SplitView.maximumWidth: parent.width * 0.9

            ColumnLayout {
                id: friendsColumn
                spacing: parent.height * 0.1
                height: parent.heightChanged

                Rectangle {
                    id: friends_title
                    Layout.leftMargin: 10
                    Text {
                        text: "Friends"
                        font.pointSize: 20
                        font.family: productsans.name
                        font.weight: Font.Bold
                        color: "#4cc2ac"
                    }
                }

                Rectangle {
                    id: friend_1
                    Layout.leftMargin: 10
                    Layout.topMargin: 30
                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        onClicked: {
                            stackView.push({
                                               item: Qt.resolvedUrl("ChatPage.qml"),
                                               properties: { chatTitle: "Friend 1" }
                                           });
                        }
                    }

                    Image {
                        id: icon_friend_1
                        source: "qrc:/res/image/erencircle.png"
                        width: 50
                        height: 50
                        anchors.verticalCenter: parent.verticalCenter
                    }

                    Text {
                        id: name_friend_1
                        text: "Friend 1"
                        font.family: productsans.name
                        font.pointSize: 16
                        font.weight: Font.Bold
                        color: "#fff"
                        anchors {
                            left: icon_friend_1.right
                            leftMargin: 20
                            verticalCenter: parent.verticalCenter
                        }
                        MouseArea {
                            anchors.fill: parent
                            hoverEnabled: true
                            onClicked: {
                                stackView.push("ChatPage.qml")
                            }
                            cursorShape: Qt.PointingHandCursor

                        }
                    }

                }


                Rectangle {
                    id: friend_2
                    Layout.leftMargin: 10
                    Layout.topMargin: 30


                    Image {
                        id: icon_friend_2
                        source: "qrc:/res/image/erencircle.png"
                        width: 50
                        height: 50
                        anchors.verticalCenter: parent.verticalCenter
                    }

                    Text {
                        id: name_friend_2
                        text: "Friend 2"
                        font.family: productsans.name
                        font.pointSize: 16
                        font.weight: Font.Bold
                        color: "#fff"
                        anchors {
                            left: icon_friend_2.right
                            leftMargin: 20
                            verticalCenter: parent.verticalCenter
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {

                                stackView.push("ChatPage.qml")
                            }
                            cursorShape: Qt.PointingHandCursor

                        }
                    }

                }
            }



        }

    }



}
