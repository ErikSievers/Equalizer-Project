/*
	digitalToAnalog.c
*/

#include "DAC.h"
#include "GPIO.h"

static void initOutput(void);

void enable_DAC(void)
{
	initOutput();
	
	init_DAC(	DAC_Channel_2, 
				DAC_Trigger_None,
				DAC_WaveGeneration_None,
				DAC_TriangleAmplitude_4095,
				DAC_OutputBuffer_Disable);
	
	DAC_Cmd(DAC_Channel_2, ENABLE);
}

static void initOutput(void)
{
	// Init PA5 for analog output
	GPIO_InitTypeDef PinInitStruct;

	PinInitStruct.GPIO_Pin = GPIO_Pin_5;
	PinInitStruct.GPIO_Mode = GPIO_Mode_AN;
	PinInitStruct.GPIO_PuPd = GPIO_PuPd_NOPULL;
	PinInitStruct.GPIO_OType = GPIO_OType_PP;
	PinInitStruct.GPIO_Speed = GPIO_High_Speed;
	
	GPIO_Init(GPIOA, &PinInitStruct);
}
