import Quickshell
import QtQuick
import Quickshell.Services.UPower

import "../Settings/" as Settings

Item {
    id: root
    
    property QtObject device: UPower.displayDevice
    property var batteryLevels: {"unknown": "U", "charging": "","battery-full-symbolic": "", "battery-good-symbolic": "", "battery-low-symbolic": "", "battery-caution-symbolic": "", "battery-empty-symbolic": ""}
    property string currentLevel: getBatteryIcon()
    property string currentState: getCurrentState()

    // UPower.onBattery
    // UPower.displayDevice.iconName -- string; full indicator state
    // UPower.displayDevice.percentage -- float;
    // UPower.displayDevice.changeRate or .energy -- float; battery usage rate, can make into a graph?
    // UPower.displayDevice.timeToFull -- float (sec            console.log("ran", device.state)onds); only on charge
    // UPower.displayDevice.timeToEmpty -- float (seconds); only on battery
    // UPower.displayDevice.isLaptopBattery -- bool; make first just to make sure we are are looking into the correct UPowerDevice

    // 4/4: 
    // 3/4: 
    // 2/4: 
    // 1/4: 
    // 0/4: 

    function getCurrentState() {
        if ( device.iconName.includes("charging") ) { 
            currentState = "charging" 
        } else {
            currentState = "unknown"
        }
    }

    function getBatteryIcon() {

        if ( currentState === "charging" ) {
            return currentLevel = "charging"
        // } else if ( currentState === "unknown" ) { 
        //     currentLevel = "unknown"
        } else if ( device.percentage > 0.80 ) { 
            currentLevel = "battery-full-symbolic" 
        } else if ( device.percentage < 0.80 && device.percentage > 0.60) {
            currentLevel = "battery-good-symbolic"
        } else if ( device.percentage < 0.60 && device.percentage > 0.40 ) {
            currentlLevel = "battery-low-symbolic"
        } else if ( device.percentage < 0.40 && device.percentage > 0.20 ) {
            currentLevel = "battery-caution-symbolic"
        } else currentLevel = "battery-empty-symbolic"
    }

    Timer {
        id: checkinTimer
        interval: 1000 // 300000 // 5 seconds, or 5 minutes
        repeat: true
        running: true
        onTriggered: {
            root.getBatteryIcon()
            root.getCurrentState()
           
        }
    }
     
    Text {
        anchors.verticalCenter: parent.verticalCenter
        text: root.batteryLevels[root.currentLevel]
        color: Settings.Theme.yellow
        font.pointSize: 9
    }
}