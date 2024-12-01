import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    id : itm
    width: 900
    height: 500
    property string chatTitle: ""
    FontLoader {
        id: productsans
        source: "qrc:/res/fonts/Product Sans Bold Italic.ttf"
    }

    StackView {
        id: stackView
        anchors.fill: parent
    }

    Rectangle {
        anchors.fill: parent
        color: "#2e3136"

        ColumnLayout {
            anchors.fill: parent
            spacing: 0

            // Header
            Rectangle {
                width: parent.width
                height: 60
                color: "#7289DA"
                radius: 10

                RowLayout {
                    anchors.fill: parent
                    spacing: 20

                    // Back Button
                    Rectangle {
                        width: 50
                        height: 50
                        radius: 10
                        color: "transparent"

                        Image {
                            source: "qrc:/res/icons/left-chevron.png"
                            anchors.centerIn: parent
                            width: 25
                            height: 25
                        }

                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                stackView.push("HomePage.qml")
                                Qt.callLater(() => close())
                            }
                            cursorShape: Qt.PointingHandCursor
                        }
                    }

                    // Chat Title
                    Text {
                        Layout.fillWidth: true
                        text: itm.chatTitle
                        font.pixelSize: 20
                        font.bold: true
                        font.family: productsans.name
                        color: "#FFFFFF"
                        horizontalAlignment: Text.AlignHCenter

                    }
                }
            }

            // Message List
            ScrollView {
                Layout.fillWidth: true
                Layout.fillHeight: true

                ListView {
                    id: chatMessages
                    width: parent.width
                    model: ListModel {
                        id: messageModel
                    }

                    delegate: Item {
                        width: ListView.view.width
                        height: messageText.height + 20

                        Rectangle {
                            width: parent.width * 0.7
                            height: parent.height
                            color: model.sender === "User" ? "#7289DA" : "#4CAF50"
                            radius: 10
                            anchors.right: model.sender === "User" ? parent.right : undefined
                            anchors.left: model.sender === "User" ? undefined : parent.left

                            Text {
                                id: messageText
                                width: parent.width - 20
                                anchors.centerIn: parent
                                text: model.message
                                font.pixelSize: 16
                                font.family: productsans.name
                                color: "#FFFFFF"
                                wrapMode: Text.Wrap
                                padding: 10
                            }
                        }
                    }
                }
            }

            // Input Area
            Rectangle {
                width: parent.width
                height: 60
                color: "#36393F"
                radius: 10

                RowLayout {
                    anchors.fill: parent
                    anchors.margins: 10
                    spacing: 15

                    TextField {
                        id: chatInput
                        Layout.fillWidth: true
                        placeholderText: "Type a message..."
                        placeholderTextColor: "#888888"
                        font.pixelSize: 16
                        font.family: productsans.name
                        color: "#FFFFFF"
                        background: Rectangle {
                            color: "#2e3136"
                            radius: 10
                        }
                        Keys.onReturnPressed: sendMessage()
                    }

                    Button {
                        text: "Send"
                        font.pixelSize: 16
                        font.family: "Product Sans"
                        onClicked: sendMessage()

                        background: Rectangle {
                            color: chatInput.text.trim() !== "" ? "#7289DA" : "#666666"
                            radius: 10
                        }
                    }
                }
            }
        }
    }

    function sendMessage() {
        const messageText = chatInput.text.trim()
        if (messageText !== "") {
            messageModel.append({ sender: "User", message: messageText })
            chatInput.text = ""
            // In a real app, you'd send the message via backend/network here

            // Optional: Simulate a response
            messageModel.append({ sender: "Friend", message: "Received: " + messageText })
        }
    }
}
