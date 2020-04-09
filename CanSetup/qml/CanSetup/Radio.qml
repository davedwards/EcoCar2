import QtQuick 1.1

Rectangle {
    width: 800
    height: 480
    color: "#00ffffff"

    property int canID: 244;
    property int vol: 10;
    property int byte8: 10;

    function volumeUp(){
        if(vol < 50){
            vol++;
            CANSend.canSend(canID, vol, byte8);
        }
    }

    function volumeDown(){
        if(vol > 0){
            vol--;
            CANSend.canSend(canID, vol, byte8);
        }
    }

    function byteUp(){
        if(byte8 < 50){
            byte8++;
            CANSend.canSend(canID, vol, byte8)
        }
    }

    function byteDown(){
        if(byte8 > 0){
            byte8--;
            CANSend.canSend(canID, vol, byte8)
        }
    }

    Rectangle {
        id: up_rect
        x: 186
        y: 149
        width: 160
        height: 55
        color: "#ffffff"

        MouseArea {
            id: vol_up
            x: 0
            y: 0
            width: 160
            height: 55

            onClicked: {
                volumeUp();
            }
        }

        Text {
            id: up
            x: 0
            y: 0
            width: 160
            height: 55
            text: qsTr("Up")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 12
        }
    }

    Rectangle {
        id: down_rect
        x: 186
        y: 293
        width: 160
        height: 55
        color: "#ffffff"

        MouseArea {
            id: vol_down
            x: 0
            y: 0
            width: 160
            height: 55

            onClicked: {
                volumeDown();
            }
        }

        Text {
            id: down
            x: 0
            y: 0
            width: 160
            height: 55
            text: qsTr("Down")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 12
        }
    }

    Rectangle {
        id: vol_rect
        x: 199
        y: 222
        width: 134
        height: 60
        color: "#ffffff"

        Text {
            id: vol_value
            x: 0
            y: 0
            width: 134
            height: 60
            text: qsTr(vol.toString())
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 12
        }
    }

    Rectangle {
        id: byte8_inc
        x: 476
        y: 149
        width: 160
        height: 55
        color: "#ffffff"
        MouseArea {
            id: byte8_up_button
            x: 0
            y: 0
            width: 160
            height: 55

            onClicked: {
                byteUp();
            }
        }

        Text {
            id: byte8_up
            x: 0
            y: 0
            width: 160
            height: 55
            text: qsTr("Byte 8 Up")
            font.pixelSize: 12
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }

    Rectangle {
        id: byte8_rect
        x: 489
        y: 222
        width: 134
        height: 60
        color: "#ffffff"
        Text {
            id: byte8_val
            x: 0
            y: 0
            width: 134
            height: 60
            text: qsTr(byte8.toString())
            font.pixelSize: 12
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }

    Rectangle {
        id: byte8_dec
        x: 476
        y: 293
        width: 160
        height: 55
        color: "#ffffff"
        MouseArea {
            id: byte_8_down_button
            x: 0
            y: 0
            width: 160
            height: 55

            onClicked: {
                byteDown();
            }
        }

        Text {
            id: byte8_down
            x: 0
            y: 0
            width: 160
            height: 55
            text: qsTr("Byte 8 Down")
            font.pixelSize: 12
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }
}
