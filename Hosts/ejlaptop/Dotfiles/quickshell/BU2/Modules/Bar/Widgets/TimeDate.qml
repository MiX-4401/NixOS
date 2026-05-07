import Quickshell
import QtQuick
import QtQuick.Layouts

import "../../../Settings/" as Settings

Item {
    id: root

    implicitHeight: parent.height
    implicitWidth: box.width

    SystemClock {
        id: clock
        precision: SystemClock.Minutes
    }

    RowLayout {
        id: box
        anchors.verticalCenter: parent.verticalCenter
        spacing: 40

        Text {
            text: Qt.formatTime(clock.date, "HH|mm")
            color: Settings.Theme.yellow
            font.family: "Martianmono Nerd Font Mono"
            anchors.left: parent.left
            font.pointSize: 9
            anchors.leftMargin: 15
        }

        // Date
        Text {
            text: Qt.formatDate(clock.date, "dd|MM")
            color: Settings.Theme.flamingo
            font.family: "Martianmono Nerd Font Mono"
            anchors.right: parent.right
            font.pointSize: 9
            anchors.rightMargin: 15
        }
    }
}