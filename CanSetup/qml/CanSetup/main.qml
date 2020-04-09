import QtQuick 1.1

Rectangle {
    id: mainMenu
    width: 800
    height: 480

    signal signalReceived1;

    Texter {
      id: myElemA
    }

    Grapher {
      id: myElemB
    }

    // without this things on the mainpage stay in the background
    function removeMainInfo(){
      //  mainText.text= "";
        mainRectangle.visible= false;
    }

    function updateReceived1(canids, texts) {
        myElemA.updater(canids, texts);
    }

    // display date on top right
    function currentDateTime() {
        var today = new Date();
        today.setDate(today.getDate())
        dateText.text = Qt.formatDateTime(today, "MM/dd/yyyy HH:mm:ss");
    }

    property bool menuToShow: false

    /* this rectangle contains the "menu" */
    Rectangle {
        id: menuView
        anchors.fill: parent
        color: "#303030";
        opacity: mainMenu.menuToShow ? 1 : 0
        Behavior on opacity { NumberAnimation { duration: 300 } }


        ListView {
            id:menuList;
            anchors { fill: parent;}
            model: nestedModel
            delegate: categoryDelegate
        }
        ListModel {
            id: nestedModel
            ListElement {
                categoryName: "Home"
                collapsed: false
            }
            ListElement {
                categoryName: "Radio"
                collapsed: true
                subItems: [
                    ListElement { itemName: "Radio" }
                ]

            }

            /* ListElement {
                categoryName: "A/C"
                collapsed: false

            }*/

            ListElement {
                categoryName: "A/C"
                collapsed: true
                subItems: [
                    ListElement { itemName: "AC" }
                ]
            }

            ListElement {
                categoryName: "Diagnostic"
                collapsed: true
                subItems: [
                    ListElement { itemName: "Output" },
                    ListElement { itemName: "Graph" }
                ]
            }
            ListElement {
                categoryName: "Settings"
                collapsed: true
                subItems: [
                    ListElement { itemName: "Time" },
                    ListElement { itemName: "Display" }
                ]
            }
        }
        Component {
            id: categoryDelegate
            Column {
                width: parent.width

                Rectangle {
                    id: categoryItem
                    color: "#00000000"
                    height: 50
                    width: 200

                    MouseArea{
                        id:categoryItemMouse
                        anchors.fill: parent
                        hoverEnabled: true
                        onClicked:{
                            removeMainInfo(); // remove main info
                            if (categoryName == "Home"){
                                onMenu();
                                mainLoader.source="main.qml";
                            }else if (categoryName == "Radio"){
                                onMenu();
                                mainLoader.source="Radio.qml";
                            }else if (categoryName == "A/C"){
                                onMenu();
                                mainLoader.source="AcWindow.qml";
                            }else if (itemName == "Output"){
                                onMenu();
                                mainLoader.source == "Texter.qml"
                            }
                        }
                    }
                    states: State {
                        name: "ColorOnEntered"
                        when: categoryItemMouse.containsMouse

                        PropertyChanges {
                            target: categoryItem
                            color: "#200000FF"
                        }
                    }

                    Rectangle {
                        height: 2;
                        width: parent.width;
                        color: "gray";
                        anchors {
                            horizontalCenter: parent.horizontalCenter;
                            bottom: parent.bottom
                        }
                    }

                    Text {
                        anchors.verticalCenter: parent.verticalCenter
                        x: 15
                        font.pixelSize: 16
                        color: "white"
                        text: categoryName
                    }

                    Rectangle {
                        color: "#00000000"
                        width: 30
                        height: 30
                        anchors.right: parent.right
                        anchors.rightMargin: 15
                        anchors.verticalCenter: parent.verticalCenter
                        Image {
                            id: menuMore
                            source: {
                                if (collapsed == true){"menuMore.png"}
                                else{""}
                            }
                        }

                        MouseArea {
                            anchors.fill: parent
                            // Toggle the 'collapsed' property
                            onClicked: nestedModel.setProperty(index, "collapsed", !collapsed)
                        }
                    }
                }

                Loader {
                    id: subItemLoader

                    // This is a workaround for a bug/feature in the Loader element. If sourceComponent is set to null
                    // the Loader element retains the same height it had when sourceComponent was set. Setting visible
                    // to false makes the parent Column treat it as if it's height was 0.
                    visible: !collapsed
                    property variant subItemModel : subItems
                    sourceComponent: collapsed ? null : subItemColumnDelegate
                    onStatusChanged: if (status == Loader.Ready) item.model = subItemModel
                }
            }

        }
        Component {
            id: subItemColumnDelegate
            Column {
                property alias model : subItemRepeater.model
                width: 200
                Repeater {
                    id: subItemRepeater
                    delegate: Rectangle {
                        id:categoryItemSub
                        height: 35
                        width: 200

                        Text {
                            anchors.verticalCenter: parent.verticalCenter
                            x: 30
                            font.pixelSize: 18
                            text: itemName
                        }
                        MouseArea{
                            id:subItemMouse
                            anchors.fill: parent
                            hoverEnabled: true
                            onClicked:{
                                removeMainInfo(); // remove main info
                                if (itemName == "Home"){
                                    onMenu();
                                    mainLoader.source="main.qml";
                                }else if (itemName == "Output"){
                                    onMenu();
                                    mainLoader.source="Texter.qml";
                                }else if (itemName == "Graph"){
                                    onMenu();
                                    mainLoader.source="Grapher.qml";
                                }else if (itemName == "Radio"){
                                    onMenu();
                                    mainLoader.source="Radio.qml";
                                }else if (itemName == "AC"){
                                    onMenu();
                                    mainLoader.source="AcWindow.qml";
                                }
                                else if (itemName == "Time"){
                                    onMenu();
                                    mainLoader.source="Time.qml"; // changed from d_text.qml
                                }

                            }
                        }
                    }
                    states: State {
                        name: "ColorOnEnteredSub"
                        when: subItemMouse.containsMouse

                        PropertyChanges {
                            target: categoryItemSub
                            color: "#300000FD"
                        }
                    }
                }
            }
        }
    }

    /* this rectangle contains the "normal" view in your app */
    Image {
        id: bg
        x: 0
        y: 0
        width: 800
        height: 480
        source: "bg.png"

//        Text {
//            id: text1
//            x: 0
//            y: 0
//            width: 800
//            height: 480
//            text: qsTr("System Loading...")
//            font.italic: false
//            font.bold: true
//            font.family: "Tlwg Typo"
//            font.pointSize: 50
//            verticalAlignment: Text.AlignVCenter
//            horizontalAlignment: Text.AlignHCenter
//            font.pixelSize: 12
//        }

        /* this is what moves the normal view aside */
        transform: Translate {
            id: moveAside
            x: 0
            Behavior on x { NumberAnimation { duration: 400; easing.type: Easing.OutQuad } }
        }

        BorderImage {
            id: menuShadow
            x: -10
            y: -10
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.margins: -10
            z: -1 /* this will place it below originalView */
            visible: mainMenu.menuToShow
            source: "shadow.png"
            border { left: 12; top: 12; right: 12; bottom: 12 }
        }

        MouseArea {
            anchors.fill: parent
            enabled: mainMenu.menuToShow
            onClicked: mainMenu.onMenu();
        }

        Image {
            id: topBar
            x: 0
            y: 0
            width: 800
            height: 50
            source: "topBar.png"
        }

        Image {
            id: menuBtn
            x: 8
            y: 8
            width: 30
            height: 30
            source: "menuBtn.png"

            MouseArea { id: ma_; x: 0; y: 8; width: 30; height: 22; anchors.topMargin: 8; anchors.fill: parent; onClicked: mainMenu.onMenu(); }
        }
        Loader{
            id:mainLoader;
            x: 0
            y: 0
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 0
            anchors.fill: parent;


  /// Tim < trying something with the date on main page


            Text {
                id: dateText
                x: 650
                y: 17
                color: "white"
                text: qsTr("Text")
                font.pixelSize: 12
                Timer {
                    repeat: true
                    running: true
                    triggeredOnStart: true
                    interval: 1000
                    onTriggered: {
                       currentDateTime();
                    }
                 }

            }
            // still working on this < Tim
            Rectangle {
                id: mainRectangle
                x: 331
                y: 181
                width: 138
                height: 165
                color: "#cccccc"
                Image {
                    id: mainImg
                    x: 9
                    y: 8
                    width: 120
                    height: 118
                    source: "csula.jpg"
                }
                Text {
                    id: mainText
                    y: 130
                    x: 10
                    width: 223
                    height: 69
                    text: qsTr("ECOCAR 2")
                    font.pixelSize: 25
                }
            }
        }
    }



    /* this functions toggles the menu and starts the animation */
    function onMenu()
    {
        //        moveAside.x = mainMenu.menuToShow ? 0 : mainMenu.width * 0.9
        moveAside.x = mainMenu.menuToShow ? 0 : 200
        mainMenu.menuToShow = !mainMenu.menuToShow;
    }
}

