import QtQuick 1.1

Rectangle {
    id: mainWindow
    width: 800
    height: 480
    color: "#00ffffff"

    /* -------------------------------------------------------------------------
       TopRowWrapper-START
       ------------------------------------------------------------------------- */
    Rectangle {
        id: topRowWrapper
        x: 0
        y: 60
        width: mainWindow.width
        height: 50
        color: "transparent"
        //color: "black"

        // ON button for the AC
        Rectangle {
            id: acOn
            x: 5
            y: 5
            width: 60
            height: 40
            color: "blue"
            radius: 5
            smooth: true
            border.width: 2
            border.color: "#FFF"
//            gradient: Gradient {
//                GradientStop {position: 0.0; color:"lightSteelBlue"}
//                GradientStop {position: 1.0; color:"blue"}
//            }

            // On Button Text
            Text {
                id: acOnText
                text: "ON"
                color: "#FFF"
                anchors.centerIn: acOn
            }

            MouseArea {
                anchors.fill: parent
                onClicked:
                {
                    CANCalls.aCToggle();

//                    if ( CANCalls.aCToggleStatus() )
//                        acOn.color = 'red';
//                    else acOn.color = 'blue';
                    console.log("ON - button clicked")
                }
            }
        }

        // OFF button for the AC
        Rectangle {
            id: acOff
            x: (acOn.x + acOn.width + acOn.x) // padding + width of ON button + padding
            y: 5
            width: 60
            height: 40
            color: "gray"
            radius: 5
            smooth: true
            border.width: 2
            border.color: "lightGray"
//            gradient: Gradient {
//                GradientStop {position: 0.0; color:"lightGray"}
//                GradientStop {position: 1.0; color:"gray"}
//            }
            // Off Button text
            Text {
                id: acOffText
                text: "OFF"
                color: "#FFF"
                anchors.centerIn: acOff
            }

            MouseArea {
                anchors.fill: parent
                onClicked:
                {
                    CANCalls.aCToggle();

//                    if ( CANCalls.aCToggleStatus() )
//                        acOff.color = 'blue';
//                    else acOff.color = 'red';
                    console.log("OFF - button clicked")
                }
            }
        }
    }
    //property int height2: 350
    /* -------------------------------------------------------------------------
       LefColumnWrapper-START
       ------------------------------------------------------------------------- */
    Rectangle {
        id: leftColumnWrapper
        x: 0;
        y: (topRowWrapper.y + topRowWrapper.height) // topRowWrapper starting Y plus its height
        width: Math.round(mainWindow.width * (1/6)); // allocate 1/6th width of the mainWindow
        height: 350
        color: "transparent"
        //color: "yellow"

        Rectangle {
            id: leftColumnContentWrapper
            x: 10
            y: (leftColumnWrapper.height - 200) / 2
            width: leftColumnWrapper.width - 10 - 10 // width of parent - 10 for left/right padding
            height: 200
            color: "transparent"

            Image {
                id: leftCarSeat
                x: 0
                y: 0
                width: leftColumnContentWrapper.width
                height: leftColumnContentWrapper.height - 40
                source: "seat.png"
            }

            /*
              Content Wrapper for High/Low buttons for the right car seat
             */
            Rectangle {
                id: leftContentButtonWrapper
                x: 0
                y: rightCarSeat.height
                width: leftColumnContentWrapper.width
                height: leftColumnContentWrapper.height - leftCarSeat.height // 200 - 160
                color: "transparent"

                // High button
                Rectangle {
                    id: leftContentHighButton
                    x: 0
                    y: 5
                    width: Math.round(leftContentButtonWrapper.width / 2.1)
                    height: leftContentButtonWrapper.height - 10
                    radius: 5
                    smooth: true
                    border.width: 2
                    border.color: "#FFF"
                    gradient: Gradient {
                        GradientStop {position: 0.0; color:"lightSteelBlue"}
                        GradientStop {position: 1.0; color:"blue"}
                    }
                    // High Button Text
                    Text {
                        id: acLefttHighText
                        text: "High"
                        color: "#FFF"
                        anchors.centerIn: leftContentHighButton
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked:
                        {
                            console.log("Left High - button clicked")
                            parent.color = "red"
                        }
                    }

                }

                // Low Button
                Rectangle {
                    id: leftContentLowButton
                    x: 5 + leftContentHighButton.width
                    y: 5
                    width: Math.round(leftContentButtonWrapper.width / 2.1)
                    height: leftContentButtonWrapper.height - 10
                    radius: 5
                    smooth: true
                    border.width: 2
                    border.color: "#FFF"
                    gradient: Gradient {
                        GradientStop {position: 0.0; color:"lightGray"}
                        GradientStop {position: 1.0; color:"gray"}
                    }
                    // Low Button Text
                    Text {
                        id: acLeftLowText
                        text: "Low"
                        color: "#FFF"
                        anchors.centerIn: leftContentLowButton
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked:
                        {
                            console.log("Left Low - button clicked")
                            parent.color = "red"
                        }
                    }

                }
            }

        }
    }

    /* -------------------------------------------------------------------------
       CenterColumnWrapper-START
       ------------------------------------------------------------------------- */
    Rectangle {
        id: centerColumnWrapper
        x: leftColumnWrapper.width // start after the leftColumnWrapper
        y: (topRowWrapper.y + topRowWrapper.height) // topRowWrapper starting Y plus its height
        width: Math.round(mainWindow.width * (4/6)); // allocate 4/6th width of the mainWindow
        height: 350
        color: "transparent"
        //color: "orange"
        /*
          Content Wrapper for top sections of AC controls
         */
        Rectangle {
            id: centerColumnTop
            x: 0
            y: 0
            width: centerColumnWrapper.width
            height: Math.round(centerColumnWrapper.height / 2)
            gradient: Gradient {
                GradientStop {position: 0.0; color:"lightGray"}
                GradientStop {position: 1.0; color:"gray"}
            }
            border.width: 2
            radius: 10
            border.color: "#FFF"
            opacity: 0.8

            //color: "transparent"

            /*
              Content Wrapper for top-LEFT sections of AC controls
             */
            Rectangle {
                id: controlsColumnLeftWrapper
                x: 0
                y: 0
                width: Math.round(centerColumnWrapper.width / 3)
                height:  centerColumnTop.height
                color: "transparent"


                /*
                  Content Wrapper for left text showing current temperature
                 */
                Rectangle {
                    id: controlsColumnLeftTextBorderWrapper
                    border.color: "#000"
                    border.width: 2
                    anchors.centerIn: controlsColumnLeftWrapper
                    color: "#FFF"
                    width: Math.round(controlsColumnLeftWrapper.width / 1.5)
                    height: Math.round(controlsColumnLeftWrapper.height / 2.5)
                    opacity: 1.0
                    radius: 7

                    Text {
                        id: controlsColumnLeftText
                        text: "80"
                        color: "#000"
                        font.pointSize: 24
                        anchors.centerIn: controlsColumnLeftTextBorderWrapper
                    }
                }

            }

            /*
              Content Wrapper for top-CENTER sections of AC controls
             */
            Rectangle {
                id: controlsColumnCenterWrapper
                x: controlsColumnLeftWrapper.width
                y: 0
                width: Math.round(centerColumnWrapper.width / 3)
                height:  centerColumnTop.height
                //color: "green"
                color: "transparent"

                Image {
                    id: centerMainLogoImage
                    width: 70
                    height: 70
                    source: "ac_logo_1.png"
                    anchors.centerIn: controlsColumnCenterWrapper
                }
            }

            /*
              Content Wrapper for top-RIGHT sections of AC controls
             */
            Rectangle {
                id: controlsColumnRightWrapper
                x: (controlsColumnLeftWrapper.width * 2)
                y: 0
                width: Math.round(centerColumnWrapper.width / 3)
                height:  centerColumnTop.height
                //color: "green"
                color: "transparent"

                /*
                 Content Wrapper for right text showing current temperature
                */
                Rectangle {
                    id: controlsColumnRightTextBorderWrapper
                    border.color: "#000"
                    border.width: 2
                    anchors.centerIn: controlsColumnRightWrapper
                    color: "#FFF"
                    width: Math.round(controlsColumnRightWrapper.width / 1.5)
                    height: Math.round(controlsColumnRightWrapper.height / 2.5)
                    opacity: 1.0
                    radius: 7

                    Text {
                        id: controlsColumnRightText
                        text: "78"
                        color: "#000"
                        font.pointSize: 24
                        anchors.centerIn: controlsColumnRightTextBorderWrapper
                    }
                }
            }
        }

        /*
          Content Wrapper for bottom sections of AC controls
         */
        Rectangle {
            id: centerColumnBottom
            x: 0
            y: centerColumnTop.height
            width: centerColumnWrapper.width
            height: Math.round(centerColumnWrapper.height / 2)
            color: "transparent"

            Rectangle {
                id: controlsColumnBottomLeftWrapper
                x: 0
                y: 0
                width: Math.round(centerColumnWrapper.width / 3)
                height:  centerColumnTop.height
                //color: "green"
                color: "transparent"

                Column {
                    anchors.centerIn: parent
                    spacing: 10

                    Button {
                        bId : "leftAcUpButton"
                        text: "+"
                        textFontSize: 24

//                        MouseArea {
//                            anchors.fill: parent
//                            onClicked:
//                            {
//                                console.log("Left + Temp - button clicked")
//                                parent.color = "red"
//                            }
//                        }
                    }

                    Button {
                        bId : "leftAcDownButton"
                        text: "-"
                        textFontSize: 24

//                        MouseArea {
//                            anchors.fill: parent
//                            onClicked:
//                            {
//                                console.log("Left - Temp - button clicked")
//                                parent.color = "red"
//                            }
//                        }
                    }
                }

            }

            /*
              Content Wrapper for bottom-MIDDLE sections of AC controls
             */
            Rectangle {
                id: controlsColumnBottomCenterWrapper
                x: controlsColumnBottomLeftWrapper.width
                y: 0
                width: Math.round(centerColumnWrapper.width / 3)
                height:  centerColumnTop.height
                //color: "green"
                color: "transparent"

                Column {
                    anchors.centerIn: parent
                    spacing: 10
                    Button {
                        // bId: acModeButton
                        text: "AC Mode"

                        MouseArea {
                            anchors.fill: parent
                            onClicked:
                            {
                                console.log("AC Mode - button clicked")
                                parent.color = "red"
                            }
                        }
                    }
                    Button {
                        // bId: acAutoButton
                        text: "Auto"

                        MouseArea {
                            anchors.fill: parent
                            onClicked:
                            {
                                console.log("Auto - button clicked")
                                parent.color = "red"
                            }
                        }
                    }
                }
            }

            Rectangle {
                id: controlsColumnBottomRightWrapper
                x: (controlsColumnBottomLeftWrapper.width * 2)
                y: 0
                width: Math.round(centerColumnWrapper.width / 3)
                height:  centerColumnTop.height
                //color: "green"
                color: "transparent"

                Column {
                    anchors.centerIn: parent
                    spacing: 10

                    Button {
                        bId : "rightAcUpButton"
                        text: "+"
                        textFontSize: 24

                        MouseArea {
                            anchors.fill: parent
                            onClicked:
                            {
                                console.log("Right + Temp - button clicked")
                                parent.color = "red"
                            }
                        }
                    }

                    Button {
                        bId : "rightAcDownButton"
                        text: "-"
                        textFontSize: 24

                        MouseArea {
                            anchors.fill: parent
                            onClicked:
                            {
                                console.log("Right - Temp - button clicked")
                                parent.color = "red"
                            }
                        }
                    }
                }

            }
        }
    }

    /* -------------------------------------------------------------------------
       RightColumnWrapper-START
       ------------------------------------------------------------------------- */
    Rectangle {
        id: rightColumnWrapper
        x: (leftColumnWrapper.width + centerColumnWrapper.width) // start after the leftColumnWrapper plus centerColumnWrapper
        y: (topRowWrapper.y + topRowWrapper.height) // topRowWrapper starting Y plus its height
        width: Math.round(mainWindow.width * (1/6)); // allocate 1/6th width of the mainWindow
        height: 350
        color: "transparent"
        //color: "blue"

        Rectangle {
            id: rightColumnContentWrapper
            x: 10
            y: (rightColumnWrapper.height - 200) / 2
            width: rightColumnWrapper.width - 10 - 10 // width of parent - 10 for left/right padding
            height: 200
            color: "transparent"

            Image {
                id: rightCarSeat
                x: 0
                y: 0
                width: rightColumnContentWrapper.width
                height: rightColumnContentWrapper.height - 40
                source: "seat.png"
            }

            /*
              Content Wrapper for High/Low buttons for the right car seat
             */
            Rectangle {
                id: rightContentButtonWrapper
                x: 0
                y: rightCarSeat.height
                width: rightColumnContentWrapper.width
                height: rightColumnContentWrapper.height - rightCarSeat.height // 200 - 160
                color: "transparent"

                // High button
                Rectangle {
                    id: rightContentHighButton
                    x: 0
                    y: 5
                    width: Math.round(rightContentButtonWrapper.width / 2.1)
                    height: rightContentButtonWrapper.height - 10
                    radius: 5
                    smooth: true
                    border.width: 2
                    border.color: "#FFF"
                    gradient: Gradient {
                        GradientStop {position: 0.0; color:"lightSteelBlue"}
                        GradientStop {position: 1.0; color:"blue"}
                    }
                    // High Button Text
                    Text {
                        id: acRightHighText
                        text: "High"
                        color: "#FFF"
                        anchors.centerIn: rightContentHighButton
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked:
                        {
                            console.log("Right High Temp - button clicked")
                            parent.color = "red"
                        }
                    }

                }

                // Low Button
                Rectangle {
                    id: rightContentLowButton
                    x: 5 + rightContentHighButton.width
                    y: 5
                    width: Math.round(rightContentButtonWrapper.width / 2.1)
                    height: rightContentButtonWrapper.height - 10
                    radius: 5
                    smooth: true
                    border.width: 2
                    border.color: "#FFF"
                    gradient: Gradient {
                        GradientStop {position: 0.0; color:"lightGray"}
                        GradientStop {position: 1.0; color:"gray"}
                    }
                    // Low Button Text
                    Text {
                        id: acRightLowText
                        text: "Low"
                        color: "#FFF"
                        anchors.centerIn: rightContentLowButton
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked:
                        {
                            console.log("Right Low Temp - button clicked")
                            parent.color = "red"
                        }
                    }

                }
            }

        }
    }
}
