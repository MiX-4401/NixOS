import Quickshell
import QtQuick
import QtQuick.Controls
import Quickshell.Services.UPower
import Quickshell.Wayland
import QtQuick.Layouts

import "../Common/" as Common
import "../Modules/" as Modules

Item {
    id: root

    // UPower.onBattery
    // UPower.displayDevice.iconName -- string; full indicator state
    // UPower.displayDevice.percentage -- float;
    // UPower.displayDevice.changeRate or .energy -- float; battery usage rate, can make into a graph?
    // UPower.displayDevice.timeToFull -- float (seconds); only on charge
    // UPower.displayDevice.timeToEmpty -- float (seconds); only on battery
    // UPower.displayDevice.isLaptopBattery -- bool; make first just to make sure we are are looking into the correct UPowerDevice

    // 4/4: 
    // 3/4: 
    // 2/4: 
    // 1/4: 
    // 0/4: 

    // // Background
    // Text {
    //     text: "            "
    // }

    // Component.onCompleted: {
    //     console.log(UPower.displayDevice.iconName)
    // }

    Button {
        text: ""
        onClicked: {
            loader.toggle()
        }
    }

    Common.MyPopup {
        id: loader
        loading: false
        active: false
        
        PopupWindow {
            color: "transparent"
            anchor.window: barMaster
            anchor.rect.y: root.parent.y + root.parent.height
            anchor.rect.x: root.parent.x + 25
            implicitWidth: root.parent.width - 50
            implicitHeight: 400
            
            visible: true
            
            Rectangle {
                anchors.fill: parent
                opacity: 1
                color: Modules.Theme.red

                bottomRightRadius: 20
                bottomLeftRadius: 20
            }
        }
    }
}