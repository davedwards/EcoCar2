#include <QtGui/QApplication>
#include "qmlapplicationviewer.h"
#include <QtCore>
#include <QtDeclarative>
#include <QUrl>

#include "CAN_Received.h"
#include "CAN_Sent.h"
#include "CAN_Calls.h"


int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QString path=QApplication::applicationDirPath()+"/qml/CanSetup/main.qml";
    QDeclarativeView view;
    view.setSource(QUrl::fromLocalFile(path));

    QObject *rootObject = dynamic_cast<QObject*>(view.rootObject());

    CanReceived canreceived;
        CanSent cansent;
        CanCalls cancalls;

        cancalls.initialSetup();
        cancalls.simulationModeSet(true);

        view.rootContext()->setContextProperty("CANReceiver", &canreceived);
        view.rootContext()->setContextProperty("CANSend", &cansent);
        view.rootContext()->setContextProperty("CANCalls", &cancalls);

    QObject::connect(rootObject, SIGNAL(signalReceived1()), &canreceived, SLOT(getDataReceived1()));
    QObject::connect(&canreceived, SIGNAL(dataReceived1(QVariant, QVariant)),rootObject, SLOT(updateReceived1(QVariant, QVariant)));

    //Comment for commit to github

    view.show();
    return app.exec();
}

