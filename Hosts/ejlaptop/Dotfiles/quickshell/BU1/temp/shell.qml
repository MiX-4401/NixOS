import Quickshell.Wayland
import Quickshell
import QtQuick
import Quickshell.Widgets
import QtQuick.Layouts

ShellRoot {
    Variants {
        model: Quickshell.screens

        PanelWindow {
            id: barMaster

            required property var modelData
            screen: modelData
            color: 'transparent'
            implicitHeight: 20
            exclusiveZone: 5

            anchors {
                top: true
                left: true
                right: true
            }

            Rectangle {
                implicitHeight: 10
                implicitWidth: parent.width
                color: "green"

                RRCorner {
                    anchors.top: parent.bottom
                    anchors.left: parent.left
                    color: parent.color
                    size: 15
                }
            }
            
        }
    }
}