import Quickshell
import QtQuick

LazyLoader {
    id: loader
    loading: false
    active: false

    function toggle() {
        this.active = !this.active
    }

    // place objects here
}