import QtQuick
import QtQuick.Controls

Window {
  id : app
    visible: true
    title: "QT Communicator"
    flags: Qt.WindowMinimizeButtonHint | Qt.WindowCloseButtonHint
    maximumWidth: 800
    maximumHeight: 600
    minimumWidth: 800
    minimumHeight: 600

    StackView {
        id: stackView
        anchors.fill: parent

        initialItem: loginPage
    }

    Login {
        id: loginPage
        width: parent.width
        height: parent.height

        Connections {
            target: loginPage // The object emitting the signal
            function onLoginsuccess() {
                    stackView.push("HomePage.qml")
                    Qt.callLater(() => close())
            }
        }
    }

}
