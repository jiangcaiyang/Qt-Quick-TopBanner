import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Window 2.2

Window {
    id: window
    visible: true

    width: 270
    height: 480
    color: "orange"

    TopBanner
    {
        id: banner
        flyDuration: 400
        text: "歌曲《爱你一万年》下载完毕。"
    }

    Button
    {
        id: runInButton
        anchors
        {
            right: runOutButton.left
            bottom: parent.bottom
        }
        text: qsTr( "渐入" )
        onClicked: banner.flyIn( )
    }

    Button
    {
        id: runOutButton
        anchors
        {
            right: parent.right
            bottom: parent.bottom
        }
        text: qsTr( "渐出" )
        onClicked: banner.flyOut( )
    }
}

