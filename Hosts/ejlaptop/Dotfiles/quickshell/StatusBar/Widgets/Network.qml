import Quickshell
import QtQuick

import "../Settings/" as Settings

Item {
    id: root

    // nmcli -t -f TYPE,STATE,DEVICE,CONNECTION device
    // : wififull
    // : ethernet
    // : no connection

    

    Text {
        anchors.verticalCenter: parent.verticalCenter
        // text: "  "
        color: Settings.Theme.yellow
    }
}