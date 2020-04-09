#ifndef CAN_SENT_H
#define CAN_SENT_H

#include <qdebug.h>
#include <QObject>
#include <QVariant>
#include <QProcess>
#include <QMessageBox>

class CanSent : public QObject
{
    Q_OBJECT

public:

    Q_INVOKABLE void canConfigSend(){

        QStringList cmdConfigSent;
        cmdConfigSent.append("canconfig can1 bitrate 33330 ctrlmode triple-sampling on");
        cmdConfigSent.append("ifconfig can1 up");
        cmdConfigSent.append("ifconfig -v");


    }

    Q_INVOKABLE QString decToHex(int decimal){
        QString decToHex;

        // Convert Decimal to Hex
        decToHex = QString::number(decimal, 16).toUpper();

        // Pad with a zero if length is less than 2
        if(decToHex.length() < 2){
            decToHex = "0" + decToHex;
        }

        return decToHex;
    }

    Q_INVOKABLE void canSend(int id, int volume, int byte){
        QStringList signalParts;
        QString canID, byte1, byte2, byte3, byte4, byte5, byte6, byte7, byte8;

        canID = QString::number(id);

        // Byte Size
        byte1 = "07";

        // Protocol Service
        byte2 = "AE";

        // CPID
        byte3 = "01";

        // DATA 0
        byte4 = "40";

        // DATA 1
        byte5 = "00";

        // DATA 2
        byte6 = "00";

        // DATA 3 (Volume)
        byte7 = decToHex(volume);

        // DATA 4
        byte8 = decToHex(byte);

        if(signalParts.length() != 0){
            signalParts.clear();
            signalParts.append(canID);
            signalParts.append(byte1);
            signalParts.append(byte2);
            signalParts.append(byte3);
            signalParts.append(byte4);
            signalParts.append(byte5);
            signalParts.append(byte6);
            signalParts.append(byte7);
            signalParts.append(byte8);
        }
        else {
            signalParts.append(canID);
            signalParts.append(byte1);
            signalParts.append(byte2);
            signalParts.append(byte3);
            signalParts.append(byte4);
            signalParts.append(byte5);
            signalParts.append(byte6);
            signalParts.append(byte7);
            signalParts.append(byte8);
        }

        for(int i = 0; i < signalParts.size(); i++){
            qDebug() << signalParts[i];
        }


    }
};

#endif // CAN_SENT_H
