#ifndef CAN_CALLS_H
#define CAN_CALLS_H

#include <qdebug.h>
#include <QObject>
#include <QVariant>
#include <QProcess>
#include <QMessageBox>
#include <stdlib.h>

class CanCalls : public QObject
{
    Q_OBJECT

    bool simulationMode;
    bool acStatus;
    bool autoTempStatus;
    bool recirculateStatus;
    bool rearDefrostStatus;
    bool frontDefrostStatus;
    bool ventTopStatus;
    bool ventFloorStatus;
    int ventFanSpeedStatus;
    int tempIncDecDriverStatus;
    int tempIncDecPassengerStatus;
    bool mediaPowerStatus;
    int radioVolumeStatus;
    int radioTunerStatus;
    int fade;
    int balance;
    int midRange;
    int treble;
    int bass;
    int source; // 1. tuner 2. satellite 3. auxilary
    bool diagnosticStatus;
    int stateOfCharge;
    int coolant;
    int battery;


public:

    Q_INVOKABLE void clickTest(){
        qDebug() << "Button Clicked!";
    }

    Q_INVOKABLE void notImplemented(){
        // this does nothing
    }

    Q_INVOKABLE void simulationModeSet(bool x){

        simulationMode = x;
    }

    Q_INVOKABLE bool simulationModeCheck(){

        return simulationMode;
    }

    Q_INVOKABLE void initialSetup(){

        if (simulationMode){
            acStatus = false;
            autoTempStatus = false;
            recirculateStatus = false;
            rearDefrostStatus = false;
            frontDefrostStatus = false;
            ventTopStatus = false;
            ventFloorStatus =false;
            ventFanSpeedStatus = 50;
            tempIncDecDriverStatus = 50;
            tempIncDecPassengerStatus = 50;
            // media
            mediaPowerStatus = false;
            radioVolumeStatus = 50;
            radioTunerStatus = 1;
            fade = 50;
            balance = 50;
            treble = 50;
            midRange = 50;
            bass = 50;
            source = 1;
            diagnosticStatus = false;
            stateOfCharge =  rand()%50 + 25;
            battery = rand()%50 + 25;
            coolant = rand()%50 + 25;
        }

    }

    Q_INVOKABLE bool aCToggleStatus(){
        if (simulationMode)
            return acStatus;
        else return false;// notImplemented();
    }
    Q_INVOKABLE void aCToggle(){
        if (simulationMode)
            acStatus = !acStatus;
        else notImplemented();
    }

    //Auto Temp Button (On/Off)
    Q_INVOKABLE bool autoTempToggleStatus(){
        if (simulationMode)
            return autoTempStatus;
        else return false;// notImplemented();
    }
    Q_INVOKABLE void autoTempToggle(){
        if (simulationMode)
            autoTempStatus = !autoTempStatus;
        else notImplemented();
    }


    // recirculate Button (On/Off)
    Q_INVOKABLE bool recirculateToggleStatus(){
        if (simulationMode)
            return recirculateStatus;
        else return false;// notImplemented();
    }
    Q_INVOKABLE void recirculateToggle(){
        if (simulationMode)
            recirculateStatus = !recirculateStatus;
        else notImplemented();
    }

    //Rear Defrost (On/Off)
    Q_INVOKABLE bool rearDefrostToggleStatus(){
        if (simulationMode)
            return rearDefrostStatus;
        else return false;// notImplemented();
    }
    Q_INVOKABLE void rearDefrostToggle(){
        if (simulationMode)
            rearDefrostStatus = !rearDefrostStatus;
        else notImplemented();
    }

    // Front Defrost (On/Off)
    Q_INVOKABLE bool frontDefrostToggleStatus(){
        if (simulationMode)
            return frontDefrostStatus;
        else return false;// notImplemented();
    }
    Q_INVOKABLE void frontDefrostToggle(){
        if (simulationMode)
            frontDefrostStatus = !frontDefrostStatus;
        else notImplemented();
    }


    //Vent (Top)
    Q_INVOKABLE bool ventTopToggleStatus(){
        if (simulationMode)
            return ventTopStatus;
        else return false;// notImplemented();
    }
    Q_INVOKABLE void ventTopToggle(){
        if (simulationMode)
            ventTopStatus = !ventTopStatus;
        else notImplemented();
    }


    //Vent (Floor)
    Q_INVOKABLE bool ventFloorToggleStatus(){
        if (simulationMode)
            return ventFloorStatus;
        else return false;// notImplemented();
    }
    Q_INVOKABLE void ventFloorToggle(){
        if (simulationMode)
            ventFloorStatus = !ventFloorStatus;
        else notImplemented();
    }


    //Vent fan speed
    Q_INVOKABLE int ventFanSpeedToggleStatus(){
        if (simulationMode)
            return ventFanSpeedStatus;
        else return -1;// notImplemented();
    }
    Q_INVOKABLE void ventFanSpeedToggle(int x){
        if (simulationMode)
            ventFanSpeedStatus = x;
        else notImplemented();
    }

    //Temp. Inc/Dec (Driver)
    Q_INVOKABLE int tempIncDecDriverToggleStatus(){
        if (simulationMode)
            return tempIncDecDriverStatus;
        else return -1;// notImplemented();
    }
    Q_INVOKABLE void tempIncDecDriverToggle(int x){
        if (simulationMode)
            tempIncDecDriverStatus = x;
        else notImplemented();
    }

    //Temp. Inc/Dec (Passenger)
    Q_INVOKABLE int tempIncDecPassengerToggleStatus(){
        if (simulationMode)
            return tempIncDecPassengerStatus;
        else return -1;// notImplemented();
    }
    Q_INVOKABLE void tempIncDecPassengerToggle(int x){
        if (simulationMode)
            tempIncDecPassengerStatus = x;
        else notImplemented();
    }

    /*  ////////////////////media starts here///////////////////////////// */

    //    Media Power on
    Q_INVOKABLE bool mediaPowerToggleStatus(){
        if (simulationMode)
            return mediaPowerStatus;
        else return -1;// notImplemented();
    }
    Q_INVOKABLE void mediaPowerOn(){
        if (simulationMode)
            mediaPowerStatus = true;
        else notImplemented();
    }
    //    Media Power off
    Q_INVOKABLE void mediaPowerOff(){
        if (simulationMode)
            mediaPowerStatus = false;
        else notImplemented();
    }

    //    Radio Volume Inc/Dec
    Q_INVOKABLE int radioVolumeIncDecStatus(){
        if (simulationMode)
            return radioVolumeStatus;
        else return false;// notImplemented();
    }
    Q_INVOKABLE void radioVolumeIncDec(int x){
        if (simulationMode)
            radioVolumeStatus = x;
        else notImplemented();
    }


    //    Switch to FM Band
    Q_INVOKABLE int radioTunerBandStatus(){
        if (simulationMode)
            return radioTunerStatus;
        else return -1;// notImplemented();
    }
    Q_INVOKABLE void radioTunerFmBand(){
        if (simulationMode)
            radioTunerStatus = 2;
        else notImplemented();
    }
    //    Switch to AM Band
    Q_INVOKABLE void radioTunerAmBand(){
        if (simulationMode)
            radioTunerStatus = 1;
        else notImplemented();
    }


    //    Change Band to next avail.
    Q_INVOKABLE void changeBandtoNext(){
        if (simulationMode)
        {
            // not sure what happens
        }
        else notImplemented();
    }

    //    Change source to next avail.

    Q_INVOKABLE void changeSourcetoNext(){
        if (simulationMode)
        {
            // not sure what happens
        }
        else notImplemented();
    }


    //    Seek Down
    Q_INVOKABLE void seekDown(){
        if (simulationMode)
        {
            // not sure what happens
        }
        else notImplemented();
    }

    //    Seek Up
    Q_INVOKABLE void seekUp(){
        if (simulationMode)
        {
            // not sure what happens
        }
        else notImplemented();
    }

    //    DVD Eject - not needed
    //    CD Eject - not needed

    //    Fade FWD/BCKWD

    Q_INVOKABLE void fadeForwardBackward(int x){
        if (simulationMode)
        {
            fade = x;
        }
        else notImplemented();
    }
    Q_INVOKABLE int fadeStatus(){
        if (simulationMode)
        {
            return fade;
        }
        else return -1;
    }


    //    Balance Left/Right
    Q_INVOKABLE void balanceLeftRight(int x){
        if (simulationMode)
        {
            balance = x;
        }
        else notImplemented();
    }
    Q_INVOKABLE int balanceStatus(){
        if (simulationMode)
        {
            return balance;
        }
        else return -1;
    }

    //    BASS Up/Down
    Q_INVOKABLE void bassUpDown(int x){
        if (simulationMode)
        {
            bass = x;
        }
        else notImplemented();
    }
    Q_INVOKABLE int bassStatus(){
        if (simulationMode)
        {
            return bass;
        }
        else return -1;
    }

    //    Midrange Up/Down
    Q_INVOKABLE void midRangeUpDown(int x){
        if (simulationMode)
        {
            midRange = x;
        }
        else notImplemented();
    }
    Q_INVOKABLE int midRangeStatus(){
        if (simulationMode)
        {
            return midRange;
        }
        else return -1;
    }

    //    Treble Up/Down
    Q_INVOKABLE void trebleUpDown(int x){
        if (simulationMode)
        {
            treble = x;
        }
        else notImplemented();
    }
    Q_INVOKABLE int trebleStatus(){
        if (simulationMode)
        {
            return treble;
        }
        else return -1;
    }

    //    DVD Source Select not-implemented
    //    CD Source Select

    //    Tuner Source Select
    Q_INVOKABLE void tunerSource(){
        if (simulationMode)
        {
            source = 1;
        }
        else notImplemented();
    }


    //    Satelite Radio Select
    Q_INVOKABLE void satelliteRadioSource(){
        if (simulationMode)
        {
            source = 2;
        }
        else notImplemented();
    }

    //    Auxiliary Select
    Q_INVOKABLE void auxiliarySource(){
        if (simulationMode)
        {
            source = 3;
        }
        else notImplemented();
    }

    Q_INVOKABLE int sourceStatus(){
        if (simulationMode)
        {
            return source;
        }
        else return -1;
    }


    /* ///////////// diagnostics start here ////////////////// */
    Q_INVOKABLE void diagnosticStatusStart (){
        if (simulationMode)
        {
            diagnosticStatus = true;
        }
    }

    Q_INVOKABLE void diagnosticStatusStop (){
        if (simulationMode)
        {
            diagnosticStatus = true;
        }
    }

    Q_INVOKABLE int stateOfChargeStatus(){
        if (simulationMode){
            stateOfCharge = randMovements(stateOfCharge);
            return stateOfCharge;
        } else
            return 50;
    }
    Q_INVOKABLE int batteryStatus(){
        if (simulationMode){
            battery = randMovements(battery);
            return battery;
        } else return 50;
    }
    Q_INVOKABLE int coolantStatus(){
        if (simulationMode){
            coolant = randMovements(coolant);
            return coolant;
        } else
            return 50;
    }
    Q_INVOKABLE int randMovements(int x){
        //console.log(x);
        x += rand() % 3;
        x -= rand() % 3;
        if (x < 0)
            x= 0;
        if  (x > 100)
            x = 100;
        return x;
    }

    // state of charge
    // coolant
    // battery


};

#endif // CAN_SENT_H
