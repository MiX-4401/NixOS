import Quickshell
import QtQuick

import "./Bar" as Bar

Scope {
    LazyLoader {
        id: barLoader
        loading: true
        active: true
        
        Bar.Bar {}
    }
}