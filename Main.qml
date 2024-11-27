import QtQuick

Window {
  id : app
    visible: true
    title: "QT Communicator"
    flags: Qt.WindowMinimizeButtonHint | Qt.WindowCloseButtonHint
    maximumWidth: 800
    maximumHeight: 600
    minimumWidth: 800
    minimumHeight: 600

    Login {
        id: loginPage
        width: parent.width
        height: parent.height

    }

}
