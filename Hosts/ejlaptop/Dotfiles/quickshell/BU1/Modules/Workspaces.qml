import Quickshell
import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland

Item {
    id: root

    implicitHeight: parent.height
    implicitWidth: layout.width + 80
    anchors.centerIn: parent

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
        if ( this.workspaces[index]?.status === true ) { return 80 }
        else { return 50 }
    }

    function getPreferredColour(index) {
        if ( this.workspaces.length < index ) {
            return Theme.flamingo
        }
        if ( this.workspaces[index]?.status === true ) { return Theme.yellow }
        else { return Theme.flamingo }
    }

    Behavior on implicitWidth {
        PropertyAnimation {
            duration: 450
            easing.type: Easing.OutExpo
        }
    }

    // Background
    Rectangle {
        anchors.fill: parent
        color: Theme.red
        bottomLeftRadius: 7
        bottomRightRadius: 7
        opacity: 0.5
    }

    // Workspaces
    RowLayout {
        id: layout

        anchors.centerIn: parent
        anchors.leftMargin: 5
        anchors.rightMargin: 5
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