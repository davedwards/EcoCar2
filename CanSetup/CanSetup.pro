# Add more folders to ship with the application, here
folder_01.source = qml/CanSetup
folder_01.target = qml
DEPLOYMENTFOLDERS = folder_01

# Additional import path used to resolve QML modules in Creator's code model
QML_IMPORT_PATH =

# If your application uses the Qt Mobility libraries, uncomment the following
# lines and add the respective components to the MOBILITY variable.
# CONFIG += mobility
# MOBILITY +=

# Speed up launching on MeeGo/Harmattan when using applauncherd daemon
# CONFIG += qdeclarative-boostable
#CONFIG += console
# The .cpp file which was generated for your project. Feel free to hack it.
SOURCES += main.cpp \
    CAN_Received.cpp

# Installation path
# target.path =

# Please do not modify the following two lines. Required for deployment.
include(qmlapplicationviewer/qmlapplicationviewer.pri)
qtcAddDeployment()

HEADERS += \
    CAN_Received.h \
    CAN_Sent.h \
    CAN_Calls.h

OTHER_FILES += \
    qml/CanSetup/Grapher.qml \
    qml/CanSetup/Texter.qml \
    qml/CanSetup/Switch.qml \
    qml/CanSetup/AC2.qml \
    qml/CanSetup/AC.qml
