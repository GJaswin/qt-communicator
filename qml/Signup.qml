import QtQuick
import QtQuick.Controls

ApplicationWindow{
    width : Screen.width
    height : Screen.height
    visible : true

    Rectangle{
        id : signup_rect
        width : 10
        height:10
        Text {
            id:print
            text : "hello"

        }
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.leftMargin: 55
        anchors.topMargin: 70
    }
    }
