import Quickshell
import QtQuick
import QtQuick.Layouts

import "../../Settings/" as Settings
import "../../Widgets/"  as Widgets
import "../../Common/"   as Common

Item {
    id: root
    property int extension: 0
    implicitWidth: box.width + this.extension

    RowLayout {
        id: box

        spacing: 20
        anchors.centerIn: parent
        
        //Widgets.Battery {}
        // Widgets.Network {}
        Widgets.TimeDate {}
    }
}