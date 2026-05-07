import Quickshell
import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland

import "../../../Settings/" as Settings


Item {
    id: root

    property int extension: 80
    implicitWidth: layout.width + extension

    // Hyprland Service
    property var workspaces: this.getWorkspaces()

    function getWorkspaces() {
        let workspaces = []
        for ( let i = 0; i < Hyprland.workspaces.values.length; i++ ) {
            let data = Hyprland.workspaces.values[i]
            workspaces.push({
                index: data.id,
                status: data.active,
            })
        }
        return workspaces
    }

    function getPreferredWidth(index) {
        if ( this.workspaces[index]?.status === true ) { return 50 }
        else { return 30 }
    }

    function getPreferredColour(index) {
        if ( this.workspaces.length < index ) {
            return Settings.Theme.flamingo
        }
        if ( this.workspaces[index]?.status === true ) { return Settings.Theme.yellow }
        else { return Settings.Theme.flamingo }
    }

    Behavior on implicitWidth {
        PropertyAnimation {
            duration: 450
            easing.type: Easing.OutExpo
        }
    }

    // Workspaces
    RowLayout {
        id: layout

        anchors.centerIn: parent
        spacing: 10

        Repeater {
            model: root.workspaces.length
            delegate: Rectangle {
                property int workstationIndex: (index + 1)
                
                id: ctx
                Layout.preferredHeight: 10
                Layout.preferredWidth: root.getPreferredWidth(index)
                color: root.getPreferredColour(index)
                radius: 5
                opacity: 0

                Component.onCompleted: animation.start()

                PropertyAnimation {
                    id: animation
                    property: "opacity"
                    target: ctx
                    to: 1
                    duration: 450
                    easing.type: Easing.OutQuart
                }

                Behavior on Layout.preferredWidth {
                    PropertyAnimation {
                        duration: 450
                        easing.type: Easing.OutExpo
                    }
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onClicked: {
                        Hyprland.dispatch("workspace " + workstationIndex)
                    }
                }
            }
        }
    }
}