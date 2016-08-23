/*
GUIinterface.c
Author: Erik Sievers
*/

/*
GUIInterface implements a simple interface for reading values that the GUI
has written to the microcontroller so that you can interface while you interface.
*/

#include "GUIInterface.h"
#include "analogToDigital.h"
#include "digitalToAnalog.h"
#include "serialCommunication.h"
#include "interruptController.h"
#include "soundBus.h"
#include "controlBus.h"
#include "echo.h"
#include "timer.h"
#include "externalDac.h"
#include "RCC.h"
#include "USART.h"
#include "TIM.h"
#include "DAC.h"
#include "GPIO.h"
#include "ADC.h"
#include "math.h"
#include "filter.h"
#include "stm32f4xx_spi.h"


float getBase(void){
	return (float)((float)EqValues[0]*0.001);
}

float getMiddle(void){
	return (float)((float)EqValues[1]*0.001);
}

float getTreble(void){
	return (float)((float)EqValues[2]*0.001);
}

short getBaseUpperLimit(void){
	return EqValues[3];
}

short getMiddleLowerLimit(void){
	return EqValues[3];
}

short getMiddleUpperLimit(void){
	return EqValues[4];
}

short getTrebleLowerLimit(void){
	return EqValues[4];
}

bool isMuted(void){
	return (EqValues[5]&0x8000);
}

bool isEchoEnabled(void){
	return ((EqValues[5]&0x4000));
}

bool isInputBased(void){
		return(EqValues[5]&0x2000);
}

short getEchoDelay(void){
		return(EqValues[5]&0x0fff);
}

short getEchoDecay(void){
		return EqValues[6];
}