pragma Singleton


import QtQuick
import Quickshell
import Quickshell.Services.UPower
import Quickshell.Io

Singleton {
    id: root

    readonly property UPowerDevice device: UPower.displayDevice
    readonly property bool batteryAvailable: device && device.ready && device.isLaptopBattery
    readonly property real batteryLevel: batteryAvailable ? Math.round(device.percentage * 100) : 0
    readonly property bool isCharging: batteryAvailable && device.state === UPowerDeviceState.Charging && device.changeRate > 0
    readonly property bool isPluggedIn: batteryAvailable && (device.state !== UPowerDeviceState.Discharging && device.state !== UPowerDeviceState.Empty)
    readonly property bool isLowBattery: batteryAvailable && batteryLevel <= 20

    property bool changeBrightness: false
    property int brightness: 50

    Process {
        id: brightnessctl
        running: root.changeBrightness
        command: [ "brightnessctl" , "set", root.brightness]
        
        onExited: {
            root.changeBrightness = false
        }
    }

    readonly property real batteryCapacity: batteryAvailable && device.energyCapacity > 0 ? device.energyCapacity : 0

    readonly property string batteryStatus: {
        if (!batteryAvailable) {
            return "No Battery"
        }

        if (device.state === UPowerDeviceState.Charging && device.changeRate <= 0) {
            return "Plugged In"
        }

        return UPowerDeviceState.toString(device.state)
    }

}
