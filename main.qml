import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.13

ApplicationWindow {
    id:main

    width: 1920
    height: 1080
    property string grey: "#365C6B"
    property int max: 9
    property int a: ran()
    property int b: ran()
    property int ab: operator(a,b)
    property string operand: addSelected ? "+" : "x"
    property bool addSelected: true
    property int counter: 0
    visible: true
    flags:Qt.Window | Qt.WindowTitleHint | Qt.WindowSystemMenuHint
    title: qsTr("Fast Calc")
    color: main.grey

    function ran() {
        return Math.floor((Math.random() * (max-2)) + 3)
    }

    function operator(a, b) {
        if (addSelected) {
            return a+b
        }
        return a*b
    }

    function reset() {
        res.visible = false
        a = ran()
        b = ran()
    }

    Item {
        focus: true
        anchors.fill: parent
        Keys.onReleased: {
            if (event.key == Qt.Key_Space) {
                if (res.visible) {
                    counter += 1
                    a = ran()
                    b = ran()
                }
                res.visible = !res.visible
            }
            if (event.key == Qt.Key_Escape) {
                counter = 0
            }
            if (event.key == Qt.Key_X) {
                addSelected = !addSelected
            }
            if (event.key == Qt.Key_1) {
                max = 9
                reset()
            }
            if (event.key == Qt.Key_2) {
                max = 19
                reset()
            }
            if (event.key == Qt.Key_3) {
                max = 29
                reset()
            }
            if (event.key == Qt.Key_4) {
                max = 99
                reset()
            }
            if (event.key == Qt.Key_5) {
                max = 299
                reset()
            }
            if (event.key == Qt.Key_6) {
                max = 999
                reset()
            }
            if (event.key == Qt.Key_7) {
                max = 2999
                reset()
            }
            if (event.key == Qt.Key_8) {
                max = 9999
                reset()
            }
            if (event.key == Qt.Key_9) {
                max = 99999
                reset()
            }
        }
    }

    Text {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: -main.height/5 + main.height/2 - font.pixelSize/2
        text: a+operand+b
        font.pixelSize: main.width/8
    }
    Text {
        id: res
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: main.height/1.7 - font.pixelSize/2
        text: ab
        visible: false
        font.pixelSize: main.width/10
    }
    Text {
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.rightMargin: font.pixelSize
        anchors.bottomMargin: font.pixelSize
        text: counter
        font.pixelSize: main.width/30
    }
}
