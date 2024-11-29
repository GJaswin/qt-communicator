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

    SplitView {
        id: mainSplit
        height: parent.height * 0.9
        anchors.fill: parent
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


            Column {
                spacing: parent.height * 0.05
                leftPadding: 10

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
            Image{
                //width : friends.width
               // height : friends.height
                source : "qrc:/res/eren"
                //fillMode : Image.PreserveAspectCrop
                //clip: true
            }

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
                    text: "Armin"
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
        implicitWidth: parent.width
        color: "#fff"
        anchors {
            top: mainSplit.bottom
        }

    }


}
