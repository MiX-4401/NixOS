import Quickshell
import QtQuick
import Quickshell.Services.UPower

import "../Settings/" as Settings

Item {
    id: root
    
    property QtObject device: UPower.displayDevice
    property var batteryIcons: [
        "", // charging 
        "", // 0/4
        "", // 1/4
        "", // 2/4
        "", // 3/4
        ""  // 4/4
    ]

    // UPower.onBattery
    // UPower.displayDevice.iconName -- string; full indicator state
    // UPower.displayDevice.percentage -- float;
    // UPower.displayDevice.changeRate or .energy -- float; battery usage rate, can make into a graph?
    // UPower.displayDevice.timeToFull -- float (sec            console.log("ran", device.state)onds); only on charge
    // UPower.displayDevice.timeToEmpty -- float (seconds); only on battery
    // UPower.displayDevice.isLaptopBattery -- bool; make first just to make sure we are are looking into the correct UPowerDevice

    function getBatteryState(){
        switch (UPower.displayDevice.state) {
            case UPowerDeviceState.Charging: return "Charging"
            case UPowerDeviceState.Discharging: return "Discharging"
            case UPowerDeviceState.FullyCharged: return "Full"
            default: return "Unknown"
        } 
    }

    function getBatteryLevel(){

        if ( device.percentage > 0.80 ) { return 5
        } else if ( device.percentage < 0.80 && device.percentage > 0.60)  { return  4
        } else if ( device.percentage < 0.60 && device.percentage > 0.40 ) { return  3
        } else if ( device.percentage < 0.40 && device.percentage > 0.20 ) { return  2
        } else return 1
    }

    function getBatteryIcon(){
        let batteryState = getBatteryState()
        let batteryLevel = getBatteryLevel()
        let icon = ""
        
        if ( batteryState === "Charging" ) { icon = batteryIcons[0]
        } else if ( batteryState === "Discharging" ) { icon = batteryIcons[batteryLevel]
        } else { icon = "idk" }

        // console.log(icon, batteryLevel, batteryState, device.percentage)

        return icon
    }

    Text {
        anchors.verticalCenter: parent.verticalCenter
        text: getBatteryIcon()
        color: Settings.Theme.yellow
        font.pointSize: 9
    }
}