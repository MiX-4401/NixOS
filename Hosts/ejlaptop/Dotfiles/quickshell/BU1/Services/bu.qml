pragma Singleton

import Quickshell
import Quickshell.Hyprland
import QtQuick

import "../Modules/" as Modules

Singleton {
    id: service

    property list<QtObject> workspaces: []

    Component.onCompleted: {
        this.initWorkspaces()
    }

    function initWorkspaces() {
        for ( let i = 0; i < Hyprland.workspace?.values.length - 1; i++ ) {
            let data = Hyprland.workspaces?.values[i] ?? null
            let ws = workspace.createObject(null, {
                index: i + 1,
                status: "inactive",
            })
            ws.checkStatus()
            this.workspaces.push(ws)
        }
    }

    function getWorkspace(index) {
        return this.workspaces[index]
    }

    function checkWorkspaces() {
        for ( let i = 0; i < Hyprland.workspace?.values.length - 1; i++ ) {
            this.workspaces[i].checkStatus()
        }
    }

    function dispatchChangeWorkspace(index) {
        Hyprland.dispatch("workspace " + index)
    }

    // Workspace wrapper
    Component {
        id: workspace

        QtObject {
            property int index;
            property string name;
            property string status;

            function getSize() {
                if ( this.status === "focused" ) { return 30 }
                else if ( this.status === "active" ) { return 30 }
                else { return 30 }
            }

            function getColour() {
                if ( this.status === "focused" ) { return Modules.Theme.sapphire }
                else if ( this.status === "active" ) { return Modules.Theme.blue }
                else { return Modules.Theme.rosewater }
            }

            function checkStatus() {
                let ws = Hyprland.workspaces.values.find( w => w.id === this.index )
                if (ws === undefined ) { this.status = "inactive" }
                else if ( ws.active ) { this.status = "focused" }
                else { this.status = "active" }
            }
        }
    }
    
    Connections {
        target: Hyprland

        function onRawEvent(event: HyprlandEvent): void {
            const eventName = event.name
            const eventData = event.data

            if ( ["workspace", "moveworkspace", "activespecial", "focusedmon"].includes(eventName) ) {
                Hyprland.refreshWorkspaces()
                Hyprland.refreshMonitors()
            }
            else if ( ["createworkspacev2", "destroyworkspacev2", "moveworkspace", "workspace", "workspacev2"].includes(event.name) ) {
                service.checkWorkspaces()
            }
        }
    }
}
