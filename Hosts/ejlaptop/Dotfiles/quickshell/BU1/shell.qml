import Quickshell.Wayland
import Quickshell
import QtQuick
import Quickshell.Widgets
import QtQuick.Layouts

import "Modules" as Modules

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
            WlrLayershell.namespace: "statusbarquickshell"

            anchors {
                top: true
                left: true
                right: true
            }

            Modules.Workspaces {}
            Modules.Date {}
            Modules.System {}
            // Inverted {}
        }
    }
}