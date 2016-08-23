/*
	serialCommunication.c
	 * 02-10-2014 : Merged with GUI/Tolkningsdel/GUIReader/SerialPortComm.c
*/
#include "serialCommunication.h"
#include "USART.h"
#include "stm32f4xx_gpio.h"
#include "stm32f4xx.h"
#include "stm32f4xx_rcc.h"
#include "GPIO.h"
#include "RCC.h"
#include "GUIInterface.h"
#include "filter.h"

#define INPUT_PIN		GPIO_Pin_6
#define OUTPUT_PIN	GPIO_Pin_7

static void init_IN_OUT(void);
int counter = 0;

void enable_USART6(void)
{
	int i=0;
	init_IN_OUT();

	// MAP PC7 to USART6
	GPIO_PinAFConfig(GPIOC, GPIO_PinSource7, GPIO_AF_USART6);
	// Map PC6 to USART6
	GPIO_PinAFConfig(GPIOC, GPIO_PinSource6, GPIO_AF_USART6);
		
	//Initialize USART6
	init_SCI(USART6, 9600, 
			 USART_WordLength_8b,
			 USART_StopBits_1, 
			 USART_Parity_No,
            USART_Mode_Rx | USART_Mode_Tx,
            USART_HardwareFlowControl_None);
			
	for (;i<7;i++){ // Initiates all parameters to 0 
		EqValues[i] = 0;
	}
}

static void init_IN_OUT(void)
{
	// Put in- and output ports in AF-mode so we can use them with USART 
	GPIO_InitTypeDef GPIO_initStruct;
	GPIO_initStruct.GPIO_Mode = GPIO_Mode_AF;		
	GPIO_initStruct.GPIO_OType = GPIO_OType_PP;
	GPIO_initStruct.GPIO_Pin = INPUT_PIN | OUTPUT_PIN;
	GPIO_initStruct.GPIO_PuPd = GPIO_PuPd_UP;
	GPIO_initStruct.GPIO_Speed = GPIO_Speed_100MHz;
	GPIO_Init(GPIOC, &GPIO_initStruct);
}

void readFromPort(void){//Reads a single message from the port and writes to the EqValues array.
	if (counter%2 == 0){
		EqValues[counter/2] = read_SCI(USART6);
		EqValues[counter/2] = EqValues[counter/2]*256;
	}
	else{
		EqValues[counter/2] += read_SCI(USART6);
	}
	counter++;
	if(counter > 13) {
		setEqualizer(getBaseUpperLimit(), 
					 getBase(),
					 getTrebleLowerLimit(),
					 getTreble(),
					 (getTrebleLowerLimit()-getBaseUpperLimit()/2)+getBaseUpperLimit(),
					 getTrebleLowerLimit()-getBaseUpperLimit(),
					 getMiddle());
		counter=0;
		writeToPort();
	}
}

void writeToPort(void){
	uint16_t value;
	int i=0;
	for(;i<7;i++){
		value = EqValues[i]/256;
		write_SCI(USART6, value);
		write_SCI(USART6, EqValues[i]-value*256);
	}
	write_SCI(USART6, isMuted());
	write_SCI(USART6, 2);
	write_SCI(USART6, getEchoDecay());
}




int readGUIValue(int space){//returns a given value from the array
	return EqValues[space];
}

void prototypeFun(void){//Not currently in use.
	while(1)
	{
		uint16_t c =read_SCI(USART6);
		write_SCI(USART6, c+1);			
	}
}
