import Quickshell
import QtQuick

Rectangle {
    Behavior on color {
        PropertyAnimation{
            duration: 100
            easing.type: Easing.InSine
        }
    }
    Behavior on x {
        PropertyAnimation{
            duration: 100
            easing.type: Easing.InSine
        }
    }
    Behavior on y {
        PropertyAnimation{
            duration: 100
            easing.type: Easing.InSine
        }
    }
    Behavior on width {
        PropertyAnimation{
            duration: 100
            easing.type: Easing.InSine
        }
    }
    Behavior on height {
        PropertyAnimation{
            duration: 100
            easing.type: Easing.InSine
        }
    }
    Behavior on opacity {
        PropertyAnimation{
            duration: 100
            easing.type: Easing.InSine
        }
    }
}