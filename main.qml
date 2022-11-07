import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

Window {
    width: 640
    height: 480
    minimumWidth: 300
    minimumHeight: 100
    visible: true
    title: qsTr("Ball move")
    Rectangle {
        id: scene
        anchors.fill: parent
        state: "MoveBall"
        Rectangle {
            id: leftRect
            x: parent.x + 50
            y: parent.height / 2 - 50
            width: 100
            height: 100
            color: "lightgrey"
            border.width: 3
            border.color: "black"
            radius: 10
            Text {
                id: leftText
                anchors.centerIn: parent
                text: "Move"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    scene.state = "MoveBall"
                    ball.x += 30
                    if (ball.x >= rightRect.x) {
                        scene.state = "ReturnBall"
                    }
                }
            }
        }
        Rectangle {
            id: rightRect
            x: parent.width - 150
            y: leftRect.y
            width: 100
            height: 100
            color: "lightgrey"
            border.width: 3
            border.color: "black"
            radius: 10
            Text {
                id: rigtText
                anchors.centerIn: parent
                text: "Return"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: scene.state = "ReturnBall"
            }
        }
        Rectangle {
            id: ball
            x: leftRect.x + 10
            y: leftRect.y + 10
            width: leftRect.width - 20
            height: leftRect.height - 20
            color: "red"
            border.width: 3
            border.color: "black"
            radius: 40
        }
    states: [
        State {
            name: "MoveBall"
            PropertyChanges {
                target: ball
                x: ball.x
            }
        },
        State {
            name: "ReturnBall"
            PropertyChanges {
                target: ball
                x: leftRect.x + 10
            }
        }
    ]
    transitions: [
        Transition {
            from: "MoveBall"
            to: "ReturnBall"

            NumberAnimation {
                property: "x"
                duration: 1000
                easing.type: Easing.OutBounce
            }
        }
    ]
    }
}
