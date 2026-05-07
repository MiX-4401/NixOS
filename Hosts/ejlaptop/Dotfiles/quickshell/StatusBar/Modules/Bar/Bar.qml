import Quickshell
import Quickshell.Widgets
import Quickshell.Wayland
import QtQuick

import "../../Widgets/"  as Widgets
import "../../Common/"   as Common
import "../../Settings/" as Settings

Variants {
    model: Quickshell.screens

    PanelWindow {
        id: master

        required property var modelData
        screen: modelData

        color: 'transparent'
        implicitHeight: 25
        exclusiveZone: 15
        WlrLayershell.namespace: "qsstatusbar"
        // WlrLayershell.layer: WlrLayershell.overlay

        anchors {
            top: true
            left: true
            right: true
        }

        margins.left: 250
        margins.right: 250

        Common.MyRectangle {
            id: background
            anchors.fill: parent
            color: Settings.Theme.maroon
            bottomLeftRadius: 15
            bottomRightRadius: 15
        }
        

        // Add widgets here
        
        Workspaces {    // Workspaces widget
            // Drop-ins
            extension: 50

            // Basic settings for widget
            anchors.centerIn: parent
            implicitHeight: master.height
            
            Common.MyRectangle { // Background
                anchors.fill: parent
                color: Settings.Theme.red
                
                topLeftRadius: 7
                bottomLeftRadius: 7
                
                topRightRadius: 7
                bottomRightRadius: 7
                
                opacity: 0.5
                anchors.margins: 2
            }
        }

        SystemTray {    // SystemTray widget
            // Drop-in settings
            extension: 30        


            // Basic settings for widget
            anchors.right: parent.right
            anchors.rightMargin: 25
            implicitHeight: parent.height

            Common.MyRectangle { // Background
                anchors.fill: parent
                color: Settings.Theme.red
                
                topLeftRadius: 7
                bottomLeftRadius: 7
                
                topRightRadius: 7
                bottomRightRadius: 7
                
                opacity: 0.5
                anchors.margins: 2
            }

        }
    }
}