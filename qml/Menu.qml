import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15

ApplicationWindow {
    visible: true
    width: 800
    height: 600
    title: "My Accounts Pop-Up Example"

    Button {
        text: "My Accounts"
        anchors.centerIn: parent
        onClicked: accountsPopup.open()
    }

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
        anchors.centerIn: parent

        contentItem: Column {
            spacing: 10
            padding: 10

            Text {
                text: "My Accounts"
                font.pixelSize: 20
                color: "#FFFFFF"
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
            }

            ListView {
                width: parent.width
                height: 250
                anchors.horizontalCenter: parent.horizontalCenter
                model: ListModel {
                    ListElement { name: "Account 1" }
                    ListElement { name: "Account 2" }
                    ListElement { name: "Account 3" }
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
                    }
                }
            }

            Button {
                text: "Close"
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: accountsPopup.close()
            }
        }
    }
}
