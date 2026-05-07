import Quickshell
import QtQuick
import QtQuick.Layouts

import "../Components/" as Components
import "../Common/" as Common

Item {
    id: root
    implicitHeight: parent.height
    implicitWidth: parent.width / 4
    anchors.right: parent.right
    anchors.rightMargin: 25



    // Background
    Rectangle {
        anchors.fill: parent
        color: Theme.red
        bottomLeftRadius: 7
        bottomRightRadius: 7
        opacity: 0.5
    }

    Components.Battery {}
}
