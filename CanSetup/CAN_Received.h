#ifndef CAN_RECEIVED_H
#define CAN_RECEIVED_H

#include <qdebug.h>
#include <QObject>
#include <QVariant>
#include <QProcess>
#include <QTimer>
#include <QFile>
#include <QMessageBox>
/*
 Errors - [101 for CMD Errors, 202 for CAN Errors]
 ===================================================

        - Error 101-N  >> Means Command Error in Config Function - Not Running
        - Error 101-S  >> Means Command Error in Config Function - Didin't Start
        - Error 202-R  >> Means CAN Error in Read Function

 */
class CanReceived : public QObject
{
    Q_OBJECT

public:

    Q_INVOKABLE void canConfig(const QString &setup, const QString &start, const QString &stop) {
        bool done = false;
        QStringList cmdConfig;
        cmdConfig.append("canconfig can0 bitrate 500000 ctrlmode triple-sampling on");    //State 0 in List
        cmdConfig.append("ifconfig can0 up");                                             //State 1 in List
        cmdConfig.append("ifconfig can0 down");                                           //State 2 in List
        cmdConfig.append("ifconfig -v");                                                  //State 3 in List

        if (setup.contains("Setup")){                   //Configure Setup Button
            if (!done) {
                done=true;
                processCommand(cmdConfig.at(0), 0);        // CMD, READ=No
            }
        }else if (start.contains("Start")){             //Configure Start Button
            if (!done) {
                done=true;
                processCommand(cmdConfig.at(1), 0);        // CMD, READ=No
                processCommand(cmdConfig.at(3), 0);        // CMD, READ=No
                testing();
                //readCAN();
            }
        }else if(stop.contains("Stop")){                 //Configure Stop Button
            if (!done) {
                done=true;
                processCommand(cmdConfig.at(2), 0);        // CMD, READ=No
                processCommand(cmdConfig.at(3), 0);        // CMD, READ=No
            }
        }
    }

    Q_INVOKABLE void testing() {
        qDebug()<< "Entered...........1";
        QString testCAN = "<0x410> [8] 11 22 33 44 55 66 77 88 <0x410> [8] 11 22 33 44 55 66 77 88aaaaaaaaaaa<0x410> [8] 11 22 33 44 55 66 77 88 ";
        qDebug()<< "Entered...........2";
        cleanCAN(testCAN);
        qDebug()<< "Entered...........3";
        QString testCAN1 = "<0x410> [8] 11 22 33 44 55 66 77 88 <0x410> [8] 11 22 33 44 55 66 77 88aaaaaaaaaaa<0x420> [8] 11 22 33 44 55 66 77 88 ";
        qDebug()<< "Entered...........4";
        cleanCAN(testCAN1);
        qDebug()<< "Entered...........5";
        QString testCAN2 = "<0x410> [8] 11 22 33 44 55 66 77 88 <0x410> [8] 11 22 33 44 55 66 77 88aaaaaaaaaaa<0x440> [8] 11 22 33 44 55 66 77 88 ";
        qDebug()<< "Entered...........6";
        cleanCAN(testCAN2);
        qDebug()<< "Entered...........7";
    }
    Q_INVOKABLE void readCAN() {
        QStringList canIDN;
        canIDN.append("0x410");
        canIDN.append("0x420");
        canIDN.append("0x430");
        canIDN.append("0x440");
        for (int i=0; i< canIDN.length();i++){
            QString crs = "candump can0 --filter="+canIDN.at(i)+":0x7ff";
            processCommand(crs, 1);        // CMD, READ=Yes
        }
    }

    Q_INVOKABLE void processCommand(const QString &command, const int &read) {
        QProcess process;
        QByteArray reader;
        QString outPut;
        if (read == 0) { //No Read
            process.start(command);
            if (process.state()== QProcess::NotRunning) {
                QMessageBox::information(0, "error", "Error 101-N: "+process.errorString());
                process.kill();
            } else if (process.waitForStarted() == false) {
                QMessageBox::information(0, "error", "Error 101-S: "+process.errorString());
                process.kill();
            } else if (process.waitForFinished() == false) {
                process.waitForFinished(-1);
            } else {
                process.waitForFinished();
            }
            process.waitForFinished();
            process.close();
        }else if (read == 1) { //Yes Read
            process.start(command);
            if (process.waitForStarted() == false) {
                QMessageBox::information(0, "error", "Error 101-S: "+process.errorString());
                process.kill();
            }
            process.waitForReadyRead();
            process.waitForBytesWritten();
            int readerSize = reader.size();
            if (readerSize > 36)
            {
                reader.resize(0);
            }
            reader = process.readAll();
            process.terminate();
            process.close();
            outPut = reader;
            cleanCAN(outPut);   // Function to Clean Output (first, <, >, [, ], last)
        }else{
            QMessageBox::information(0, "error", "Error 101-D: Read or Write value is incorrect");
            process.kill();
        }

    }
    Q_INVOKABLE void cleanCAN(QString &cleaner) {
        QString cleaned;
        cleaned = cleaner.remove(0, 83); //First
        cleaned = cleaned.remove(QChar('<'), Qt::CaseInsensitive);
        cleaned = cleaned.remove(QChar('>'), Qt::CaseInsensitive);
        cleaned = cleaned.remove(QChar('['), Qt::CaseInsensitive);
        cleaned = cleaned.remove(QChar(']'), Qt::CaseInsensitive);
        cleaned = cleaned.remove(31,31); //Last Space
        qDebug()<< "Entered...........8";
        write(cleaned);
        qDebug()<< "Entered...........9";
    }

    Q_INVOKABLE void write(const QString &infoCAN) {
        QStringList parts;
        QString CANid, CANbyte, CANdata1, CANdata2, CANdata3, CANdata4, CANdata5, CANdata6, CANdata7, CANdata8;
        parts = infoCAN.split(" ", QString::KeepEmptyParts);
        if (parts.length() == 10) {
            CANid    = parts[0];
            CANbyte  = parts[1];
            CANdata1 = parts[2];
            CANdata2 = parts[3];
            CANdata3 = parts[4];
            CANdata4 = parts[5];
            CANdata5 = parts[6];
            CANdata6 = parts[7];
            CANdata7 = parts[8];
            CANdata8 = parts[9];
            qDebug()<< "Entered...........10";
            dbCAN(CANid, CANbyte, CANdata1, CANdata2, CANdata3, CANdata4, CANdata5, CANdata6, CANdata7, CANdata8);
            qDebug()<< "Entered...........11";
        }else {
            QMessageBox::information(0, "error", "Error 202-R: Didn't receive CAN Message ID");
        }
    }

    Q_INVOKABLE void dbCAN(const QString &canID, const QString &canByte, const QString &canFrame1, const QString &canFrame2, const QString &canFrame3, const QString &canFrame4, const QString &canFrame5, const QString &canFrame6, const QString &canFrame7, const QString &canFrame8) {

        if (canID == "0x410") {
            float factor410 = 0.5;
            float offset410 = 0;
            algorithm(canID, canFrame4, factor410, offset410);
            qDebug()<< "Entered...........12";
        }
        else if (canID == "0x420") {
            float factor420 = 0.5;
            float offset420 = 40;
            algorithm(canID, canFrame6, factor420, offset420);
            qDebug()<< "Entered...........13";
        } else if (canID == "0x430") {
        }else if (canID == "0x440") {
            float factor440 = 0.025;
            float offset440 = 1000;
            algorithm(canID, (canFrame3+canFrame4), factor440, offset440);
            qDebug()<< "Entered...........14";
        }
    }
    Q_INVOKABLE void algorithm(const QString &canID, const QString &canFrame, const float &factor, const float &offset){
        bool ok = false;
        QString hexToDec = QString::number(canFrame.toUInt(&ok,16));
        float outputFloat = hexToDec.toFloat();
        int calcResult = (outputFloat * factor) - offset;
//        qDebug()<< "CANID = " << canID << ", calcResult = " << calcResult;
        emit dataReceived1(QVariant(canID), QVariant(calcResult));
    }
public slots:
    void getDataReceived1() {
        QString sendToQmlID;
        QString sendToQmlResult;
        emit dataReceived1(QVariant(sendToQmlID), QVariant(sendToQmlResult));
    }

signals:
    void dataReceived1(QVariant dataReceived1, QVariant dataReceived2);
};

#endif // CAN_RECEIVED_H
