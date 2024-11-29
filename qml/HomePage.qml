import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

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
    /*
      // right click menus
    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton | Qt.RightButton
        onClicked: {
            if (mouse.button === Qt.RightButton)
                contextMenu.popup()
        }
        onPressAndHold: {
            if (mouse.source === Qt.MouseEventNotSynthesized)
                contextMenu.popup()
        }

        Menu {
            id: contextMenu
            MenuItem { text: "Cut" }
            MenuItem { text: "Copy" }
            MenuItem { text: "Paste" }
        }
    }
    */


    SplitView {
        id: mainSplit
        height: parent.height * 0.9
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: statusBar.top
        handle: Rectangle {
            implicitWidth: 3
            color: "#275e54"

        }

        Rectangle {
            id: teams
            color: "#11332d"
            SplitView.minimumWidth: parent.width * 0.3
            SplitView.preferredWidth: parent.width * 0.4
            SplitView.maximumWidth: parent.width * 0.9


            //left rectangle to hold icons
            Rectangle {
                id: leftBar
                width: 40
                height: teams.height
                border.width: 1
                border.color: "#275e54"
                color: "#11332d"
                opacity: 0.9
                anchors {
                    left: teams.left
                }

                Item{
                    id: info_icon

                    Image{

                        width : 40
                        height : 40
                        source : "qrc:/res/icons/info.png"
                        mipmap : true
                        fillMode : Image.PreserveAspectCrop
                        clip: true

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
                        clip: true

                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                var secondPage = Qt.createComponent("Settings.qml").createObject(null, {});
                                secondPage.show();
                            }
                        }
                    }
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 100
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
                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true

                        onEntered: team_1.color = "#fff" // Change color on hover
                        onExited: team_1.color = "transparent" // Revert color when hover stops
                    }

                    Image {
                        id: icon_team_1
                        source: "qrc:/res/image/erenyeager.jpg"
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
                    }

                }


                Rectangle {
                    id: team_2
                    Layout.leftMargin: 10
                    Layout.topMargin: 30

                    Image {
                        id: icon_team_2
                        source: "qrc:/res/image/erenyeager.jpg"
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
                    }

                }
            }

        }

        Rectangle {
            id: friends
            color: "#0d1f1b"
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

                    Image {
                        id: icon_friend_1
                        source: "qrc:/res/image/erenyeager.jpg"
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
                    }

                }


                Rectangle {
                    id: friend_2
                    Layout.leftMargin: 10
                    Layout.topMargin: 30

                    Image {
                        id: icon_friend_2
                        source: "qrc:/res/image/erenyeager.jpg"
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
                    }

                }
            }



        }

    }

    Rectangle {
        id: statusBar
        height: parent.height * 0.1
        width: parent.width
        color: "#1a1a1a"
        anchors {
            bottom: parent.bottom
            left: parent.left
            right: parent.right
        }

    }


}
