import QtQuick 2.4
import QtQuick.Window 2.2
import Bacon2D 1.0 as BB;

Window {
    id: mainWindow
    visible: true
    width: 200
    height: 100

    property bool leftKey: false
    property bool rightKey: false
    property bool lastMirror: false

    BB.Game {
        id: game
        gameName: "bacon2dtest"
        anchors.fill: parent
        currentScene: initialScene

        BB.Scene {
            id: initialScene
            width: parent.width
            height: parent.height
            BB.Entity {
                anchors.centerIn: parent
                behavior:
                    BB.ScriptBehavior {
                        script: {
                            if (mainWindow.leftKey)
                            {
                                sprite.animation = "walking";
                                sprite.horizontalMirror = false;
                                //mainWindow.lastMirror = false;
                            }
                            else if (mainWindow.rightKey)
                            {
                                sprite.animation = "walking";
                                sprite.horizontalMirror = true;
                                //mainWindow.lastMirror = true;
                            }
                            else
                            {
                                sprite.animation = "idle";
                            }
                            //console.debug(mainWindow.lastMirror);
                            //sprite.horizontalMirror = mainWindow.lastMirror;
                        }
                    }
                BB.Sprite {
                    id: sprite
                    scale: 2
                    spriteState: BB.Bacon2D.Running
                    animation: "idle"
                    animations: [
                        BB.SpriteAnimation {
                            id: walkingAnimation
                            name: "walking"
                            source: "miner rico walking.png"
                            frames: 4
                            duration: 2000
                            loops: Animation.Infinite
                        }
                        ,
                        BB.SpriteAnimation {
                            id: idleAnimation
                            name: "idle"
                            source: "miner rico idle.png"
                            frames: 1
                            duration: 1000
                            loops: Animation.Infinite
                        }
                    ]
                }
            }
            Keys.enabled: true
            Keys.onPressed: {
                if (event.key === Qt.Key_Left)
                {
                    leftKey = true;
                }
                if (event.key === Qt.Key_Right)
                {
                    rightKey = true;
                }
            }
            Keys.onReleased: {
                if (event.key === Qt.Key_Left)
                {
                    leftKey = false;
                }
                if (event.key === Qt.Key_Right)
                {
                    rightKey = false;
                }
            }
        }
    }
}
