
import Quickshell // for PanelWindow
import Quickshell.Io
import QtQuick // for Text
import QtQuick.Controls
import Quickshell.Widgets
import QtQuick.Layouts
import QtQuick.Shapes
import Qt.labs.platform
import QtQml
import "../services"
import "../items"
import "../"

pragma ComponentBehavior: Bound 

BarModuleItem {
    id:root
    visibleExpandedElements:3
    BarContentItem {
        implicitWidth: root.scaleHeightMin
        implicitHeight: root.scaleHeightMin
        contentItem: TextItem {
            id:textitem
            anchors.centerIn: parent
            text: " "
            color: root.config.props.secondaryColor
        }
        onClicked: {
            Settings.curridx = root.uniqueIndex == Settings.curridx ? -1 : root.uniqueIndex
        }
    }
    BarContentItem {
        implicitWidth: root.scaleHeightMin
        implicitHeight: root.scaleHeightMin
        contentItem: TextItem {
            text: " "
            color: root.config.props.secondaryColor
        }
        onClicked: {
            Settings.changeBarState()
        }
    }
    BarContentItem {
        implicitWidth: root.scaleHeightMin
        implicitHeight: root.scaleHeightMin
        contentItem: TextItem {
            text: " "
            color: root.config.props.secondaryColor
        }
        onClicked: {
            Settings.nextConfig()
            SysInfo.nextWallpaper()
        }
    }

    BarContentItem {
        implicitWidth: root.scaleHeightMin
        implicitHeight: root.scaleHeightMin
        contentItem: TextItem {
            text: " "
            color: root.config.props.secondaryColor
        }
        onClicked: {
            Quickshell.execDetached(["sh" ,"-c","niri msg action screenshot"])
        }
    }
   
    BarContentItem {
        implicitWidth: root.scaleHeightMin
        implicitHeight: root.scaleHeightMin
        contentItem: TextItem {
            text: "⏻ "
            color: root.config.props.secondaryColor
        }
        onClicked: {
            Quickshell.execDetached(["shutdown" ,"now"])
        }
    }
    BarContentItem {
        implicitWidth: root.scaleHeightMin
        implicitHeight: root.scaleHeightMin
        contentItem: TextItem {
            text: " "
            color: root.config.props.secondaryColor
        }
        onClicked: {
            Quickshell.execDetached(["reboot"])
        }
    }
}


