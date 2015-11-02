// TopBanner.qml
// Made By jiangcaiyang@qtdream.com
// 2015年11月2日15:50:54

import QtQuick 2.5
import QtQuick.Controls 1.4

Rectangle
{
    id: root
    width: 0
    height: fm.height * 3
    color: "lightsteelblue"
    clip: true

    property int flyDuration: 500
    property alias text: messageLabel.text

    FontMetrics { id: fm }

    Label
    {
        id: messageLabel
        width: root.parent.width
        height: root.height
        anchors.left: flyOutAnim.running? root.left: undefined
        anchors.right: flyInAnim.running? root.right: undefined
    }

    ParallelAnimation
    {
        id: flyInAnim
        running: false
        NumberAnimation
        {
            target: root
            property: "width"
            from: 0
            to: root.parent.width
            duration: root.flyDuration
            easing.type: Easing.OutQuint
        }
        ScriptAction
        {
            script:
            {
                root.x = 0;
                messageLabel.x = -root.parent.width;
            }
        }
    }

    ParallelAnimation
    {
        id: flyOutAnim
        running: false
        NumberAnimation
        {
            target: root
            property: "width"
            from: root.parent.width
            to: 0
            duration: root.flyDuration
            easing.type: Easing.InQuint
        }
        NumberAnimation
        {
            target: root
            property: "x"
            from: 0
            to: root.parent.width
            duration: root.flyDuration
            easing.type: Easing.InQuint
        }
    }

    function flyIn( )
    {
        root.x = 0;
        messageLabel.x = -root.parent.width;
        flyInAnim.start( );
    }

    function flyOut( )
    {
        flyOutAnim.start( );
    }
}
