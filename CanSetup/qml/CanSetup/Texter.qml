import QtQuick 1.1

Rectangle {
    id: mainWindow
    width: 800
    height: 480
    color: "#00ffffff"

    function updater(canid, text) {
        var id = canid;
        var rX = text;
        if (id === "0x410") {
            c410_out_text.text = rX+" %";
        }else if (id === "0x420") {
            c420_out_text.text = rX+" Degc";
        } else if (id === "0x430") {
        }else if (id === "0x440") {
            c440_out_text.text = rX+" amps";
        }
    }

    function currentDateTime() {
        var today = new Date();
        today.setDate(today.getDate())
        dateTime_text.text = Qt.formatDateTime(today, "MM/dd/yyyy");
    }

    function setStopText(){
        var j = "";
        c410_out_text.text = j         //clear text
        c420_out_text.text = j         //clear text
        c430_out_text.text = j         //clear text
        c440_out_text.text = j         //clear text
    }

    function setSetupText(){
        var k = "Configuring System......Done";
        c410_out_text.text = k         //clear text
        c420_out_text.text = k         //clear text
        c430_out_text.text = k         //clear text
        c440_out_text.text = k         //clear text
    }

    property bool done: false

    property string setup       //Pass setup button value
    function can_Setup(){
        setup = setup_text.text;
        start = "";
        stop = "";
        CANReceiver.canConfig(setup, start, stop);
        setSetupText();
    }

    property string start       //Pass start button value
    function can_Start(){
        setup = "";
        start = start_text.text;
        stop = "";
        CANReceiver.canConfig(setup, start, stop);
        console.log("Started");
    }

    property string stop        //Pass stop button value
    function can_Stop(){
        setup = "";
        start = "";
        stop = stop_text.text;
        CANReceiver.canConfig(setup, start, stop);
        setStopText();
    }
    Rectangle {
        x: 60
        y: 176
        width: 680
        height: 53
        color: "#00000000"

        Rectangle {
            id: c410_rec1
            x: 0
            y: 1
            width: 167
            height: 50
            border.color: "#000000"
            border.width: 3
        }

        Text {
            id: c410_text1
            x: 0
            y: 1
            width: 167
            height: 50
            text: qsTr("BCM_SOC (0x410)")
            font.pixelSize: 12
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter

        }

        Rectangle {
            id: c410_out_rec1
            x: 187
            y: 1
            width: 490
            height: 50
            color: "#00000000"
            border.color: "#000000"
            border.width: 3
        }

        Text {
            id: c410_out_text
            x: 187
            y: 1
            width: 490
            height: 50
            font.pixelSize: 12
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            Timer {
                id:timer410
                onTriggered: {
                    can_Start();
                }
            }
        }

    }

    Rectangle {
        x: 60
        y: 246
        width: 680
        height: 53
        color: "#00000000"
        Rectangle {
            id: c410_rec2
            x: 0
            y: 2
            width: 167
            height: 50
            border.color: "#000000"
            border.width: 3
        }

        Text {
            id: c410_text2
            x: 0
            y: 2
            width: 167
            height: 50
            text: qsTr("BCM_T_COOLANT (0x420)")
            font.pixelSize: 12
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }

        Rectangle {
            id: c410_out_rec2
            x: 188
            y: 2
            width: 490
            height: 50
            color: "#00000000"
            border.color: "#000000"
            border.width: 3
        }

        Text {
            id: c420_out_text
            x: 188
            y: 2
            width: 490
            height: 50
            font.pixelSize: 12
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            Timer {
                id:timer420
                onTriggered: {
                    can_Start();
                }
            }
        }
    }

    Rectangle {
        x: 60
        y: 318
        width: 680
        height: 53
        color: "#00000000"
        Rectangle {
            id: c410_rec3
            x: 0
            y: 2
            width: 167
            height: 50
            border.color: "#000000"
            border.width: 3
        }

        Text {
            id: c410_text3
            x: 0
            y: 2
            width: 167
            height: 50
            text: qsTr("CAN ID 430")
            font.pixelSize: 12
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }

        Rectangle {
            id: c410_out_rec3
            x: 188
            y: 2
            width: 490
            height: 50
            color: "#00000000"
            border.color: "#000000"
            border.width: 3
        }

        Text {
            id: c430_out_text
            x: 188
            y: 2
            width: 490
            height: 50
            font.pixelSize: 12
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            Timer {
                id:timer430
                onTriggered: {
                    can_Start();
                }
            }
        }
    }

    Rectangle {
        x: 60
        y: 390
        width: 680
        height: 53
        color: "#00000000"
        Rectangle {
            id: c410_rec4
            x: 0
            y: 2
            width: 167
            height: 50
            border.color: "#000000"
            border.width: 3
        }

        Text {
            id: c410_text4
            x: 0
            y: 2
            width: 167
            height: 50
            text: qsTr("BCM_IBAT2 (0x440)")
            font.pixelSize: 12
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }

        Rectangle {
            id: c410_out_rec4
            x: 188
            y: 2
            width: 490
            height: 50
            color: "#00000000"
            border.color: "#000000"
            border.width: 3
        }

        Text {
            id: c440_out_text
            x: 188
            y: 2
            width: 490
            height: 50
            font.pixelSize: 12
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            Timer {
                id:timer440
                onTriggered: {
                    can_Start();
                }
            }
        }
    }

    //    Rectangle {
    //        id: dateTime_rec
    //        x: 558
    //        y: 18
    //        width: 182
    //        height: 50
    //        color: "#d4e1f1"
    //        border.width: 3
    //        border.color: "#000000"
    //    }

    //    Text {
    //        id: dateTime_text
    //        x: 558
    //        y: 18
    //        width: 182
    //        height: 53
    //        verticalAlignment: Text.AlignVCenter
    //        horizontalAlignment: Text.AlignHCenter
    //        font.pixelSize: 12
    //        Timer {
    //            repeat: true
    //            running: true
    //            triggeredOnStart: true
    //            interval: 1000
    //            onTriggered: {
    //                currentDateTime();
    //            }
    //        }
    //    }
//myElemA.updater(canids, texts);
    Rectangle {
        id: start_rec
        x: 60
        y: 110
        width: 150
        height: 50
        color: "#000000"


        MouseArea {
            id: start_mousearea
            x: 0
            y: 0
            width: 150
            height: 50
            onPressed: {}
            onReleased: {}
            onClicked: {

                timer410.start();
                timer410.repeat = true
                timer410.triggeredOnStart = true
                timer410.interval = 100 //10ms

                timer420.start();
                timer420.repeat = true
                timer420.triggeredOnStart = true
                timer420.interval = 100 //10ms

                timer430.start();
                timer430.repeat = true
                timer430.triggeredOnStart = true
                timer430.interval = 100 //10ms

                timer440.start();
                timer440.repeat = true
                timer440.triggeredOnStart = true
                timer440.interval = 100 //10ms
                console.log("Entered Start Configuration");
            }
        }

        Text {
            id: start_text
            x: 0
            y: 0
            width: 150
            height: 50
            color: "#ffffff"
            text: qsTr("Start")
            font.pointSize: 13
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 12
        }

        Item {
            id: start_item
            x: 0
            y: 0
            width: 150
            height: 50
        }


    }

    Rectangle {
        id: stop_rec
        x: 590
        y: 110
        width: 150
        height: 50
        color: "#000000"
        MouseArea {
            id: stop_mousearea
            x: 0
            y: 0
            width: 150
            height: 50
            onPressed: {}
            onReleased: {}
            onClicked: {
                timer410.stop();
                timer420.stop();
                timer430.stop();
                timer440.stop();
                can_Stop();
                console.log("Entered Stop Configuration");
            }
        }

        Text {
            id: stop_text
            x: 0
            y: 0
            width: 150
            height: 50
            color: "#ffffff"
            text: qsTr("Stop")
            font.pixelSize: 12
            font.bold: true
            font.pointSize: 13
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }

        Item {
            id: stop_item
            x: 0
            y: 0
            width: 150
            height: 50
        }


    }

    Rectangle {
        id: setup_rec
        x: 319
        y: 110
        width: 150
        height: 50
        color: "#000000"
        MouseArea {
            id: setup_mousearea
            x: 0
            y: 0
            width: 150
            height: 50
            onPressed: {}
            onReleased: {}
            onClicked: {
                if (!done){
                    can_Setup();
                    console.log("Entered Setup Configuration");
                    done = true;
                }
            }
        }

        Text {
            id: setup_text
            x: 0
            y: 0
            width: 150
            height: 50
            color: "#ffffff"
            text: qsTr("Setup")
            font.pixelSize: 12
            font.bold: true
            font.pointSize: 13
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }

        Item {
            id: setup_item
            x: 0
            y: 0
            width: 150
            height: 50
        }
    }
}
