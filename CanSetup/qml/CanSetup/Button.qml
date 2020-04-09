import QtQuick 1.1

Rectangle {

    property string secondId: "default"
    id: button
    width: 145;
    height: 60
    color: "blue"
    smooth: true;
    radius: 5

    property alias text: label.text
    property alias textFontSize: label.font.pointSize
    property alias bWidth: button.width
    property alias bHeight: button.height
    property alias bRadius: button.radius
    property alias bId: button.secondId

    border {
        color: "#FFF";
        width: 2
    }

    gradient: Gradient {
        GradientStop {position: 0.0; color:"lightSteelBlue"}
        GradientStop {position: 1.0; color:"blue"}
    }

    Text {
        id: label
        anchors.centerIn: parent
        text: "Click Me!"
        font.pointSize: 12
        color: "#FFF"
    }

    MouseArea {
        anchors.fill: parent
        onClicked: handleClick(button.secondId)
    }

    /*
      default function to handle the button click events.
      */
    function handleClick(text) {

        var currentDegreesValue = null;

        switch(text) {

        case "leftAcUpButton":
            currentDegreesValue = controlsColumnLeftText.text;
            incrementLabelTextById(controlsColumnLeftText, currentDegreesValue);
            break;
        case "leftAcDownButton":
            currentDegreesValue = controlsColumnLeftText.text;
            decrementLabelTextById(controlsColumnLeftText, currentDegreesValue);
            break;
        case "rightAcUpButton" :
            currentDegreesValue = controlsColumnRightText.text;
            incrementLabelTextById(controlsColumnRightText, currentDegreesValue);
            break;
        case "rightAcDownButton":
            currentDegreesValue = controlsColumnRightText.text;
            decrementLabelTextById(controlsColumnRightText, currentDegreesValue);
            break;
        }
    }

    function incrementLabelTextById(labelId, currentValue) {
        if (labelId !== null && currentValue !== null) {
            currentValue++;
            labelId.text = currentValue
        }
    }

    function decrementLabelTextById(labelId, currentValue) {
        if (labelId !== null && currentValue !== null) {
            currentValue--;
            labelId.text = currentValue
        }
    }
}
