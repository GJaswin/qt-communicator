import QtQuick
import QtQuick.Controls

ApplicationWindow {
    id: root
    width: 700
    height: 400
    color : "#36393f"
    visible: true
    title: "About Yeagarist"


    FontLoader {
        id: productsans
        source: "qrc:/res/fonts/Product Sans Bold Italic.ttf"

    }
    Image {
        id: logo
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.margins: 20

        source: "qrc:/res/image/erencircle.png"
        sourceSize.width: 80
        sourceSize.height: 80
        fillMode: Image.PreserveAspectFit

        smooth: true
        antialiasing: true
        asynchronous: true
    }
    ScrollView {
      anchors.top: logo.bottom
      anchors.left: parent.left
      anchors.right: parent.right
      anchors.bottom: parent.bottom
      anchors.margins: 20

      TextArea {
          horizontalAlignment: Text.AlignHCenter
          textFormat: Text.RichText
          font.pixelSize : 20
          font.family: productsans.name


          text: qsTr("<h3>About Yeagerist</h3>"
                   + "<p>WE ARE THE YEAGERIST THE TRUE FOLLOWERS THE EREN YEAGER.</p>"
                   + "<p>EREN LOVES MIKASA</p>"
                   )
          color: "white"
          wrapMode: Text.WordWrap
          readOnly: true
          antialiasing: true
          background: null

      }
    }
}
