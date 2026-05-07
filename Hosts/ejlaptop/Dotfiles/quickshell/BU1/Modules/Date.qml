import Quickshell
import QtQuick
import QtQuick.Layouts

Item {
    id: root
    implicitHeight: parent.height
    implicitWidth: parent.width / 4
    anchors.left: parent.left
    anchors.leftMargin: 25

    // Background
    Rectangle {
        anchors.fill: parent
        color: Theme.red
        bottomLeftRadius: 7
        bottomRightRadius: 7
        opacity: 0.5
    }

    SystemClock {
    id: clock
    precision: SystemClock.Minutes
    }

    // Time
    Text {
        text: Qt.formatTime(clock.date, "hh:mm AP")
        color: Theme.yellow
        font.family: "Martianmono Nerd Font Mono"
        anchors.left: parent.left
        anchors.leftMargin: 20
        font.pointSize: 9
        anchors.verticalCenter: parent.verticalCenter
    }

    // Date
    Text {
        text: Qt.formatDate(clock.date, "dddd d MMMM")
        color: Theme.flamingo
        font.family: "Martianmono Nerd Font Mono"
        anchors.right: parent.right
        anchors.rightMargin: 20
        font.pointSize: 9
        anchors.verticalCenter: parent.verticalCenter
    }
}