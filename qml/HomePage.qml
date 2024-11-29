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
            SplitView.minimumWidth: parent.width * 0.1
            SplitView.preferredWidth: parent.width * 0.3
            SplitView.maximumWidth: parent.width * 0.9


            //left rectangle to hold icons
            Rectangle {
                width: 40
                height: teams.height
                color: "white"
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
                    anchors.bottomMargin: 90
                    anchors.left :  parent.left
                    anchors.leftMargin : 5


                }

            }


            Column {
                spacing: parent.height * 0.05
                leftPadding: 60

                Text {
                    id: team_title
                    text: "Teams"
                    font.pointSize: 20
                    font.family: productsans.name
                    color: "#4cc2ac"
                }
                Text {
                    text: "Team 1"
                    color: "#fff"
                }

            }

        }

        Rectangle {
            id: friends
            color: "#0d1f1b"
            SplitView.minimumWidth: parent.width * 0.1
            SplitView.preferredWidth: parent.width * 0.7
            SplitView.maximumWidth: parent.width * 0.9


            Column{
                spacing: parent.height * 0.05
                Text {
                    anchors {
                        left: parent.left
                        leftMargin: 10
                    }
                    text: "Friends"
                    font.pointSize: 20
                    font.family: productsans.name
                    color: "#4cc2ac"
                }

                Text {
                    text: "MIKASA"
                    font.family: productsans.name
                    color: "#fff"
                    anchors {
                        left: parent.left
                        leftMargin: 10
                    }
                }


            }

        }

    }

    Rectangle {
            id: statusBar
            height: parent.height * 0.1
            width: parent.width
            color: "#fff"
            anchors {
                bottom: parent.bottom
                left: parent.left
                right: parent.right
            }

    }


}
