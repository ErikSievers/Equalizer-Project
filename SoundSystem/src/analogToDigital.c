/*
	analogToDigital.c
*/

#include "analogToDigital.h"
#include "ADC.h"
#include "GPIO.h"
#include <stdint.h>

static void initInput(void);

void enable_ADC1(void) 
{	
	initInput();
	
	initCommon_ADC(	ADC_Mode_Independent, 
					ADC_Prescaler_Div8, 
					ADC_DMAAccessMode_Disabled, 
					ADC_TwoSamplingDelay_5Cycles);
	
	init_ADC(	ADC_Resolution_12b, 
						DISABLE,		// ScanConvMode
						ENABLE,		// ContinousConvMode
						ADC_ExternalTrigConvEdge_None,   
						ADC_ExternalTrigConv_T2_TRGO,				//      
						ADC_DataAlign_Right, 
						1);
	
	// Enable conversion with ADC1
	ADC_Cmd(ADC1, ENABLE);
	
	// Channel configuration
	ADC_RegularChannelConfig(ADC1, ADC_Channel_10, 1, ADC_SampleTime_144Cycles);
	
}

static void initInput(void)
{
	// Init PC3 for analog input
	init_GPIO(	GPIOC, 
				GPIO_Pin_0, 
				GPIO_Mode_AN, 
				GPIO_High_Speed, 
				GPIO_OType_PP, 
				GPIO_PuPd_NOPULL);
}

uint16_t ADC1_startConversion(void)
{
	
	
	// Start conversion
	ADC_SoftwareStartConv(ADC1);
	// Wait until conversion is done
	while(ADC_GetFlagStatus(ADC1, ADC_FLAG_EOC) == RESET);	
	// Return converted value
	return ADC_GetConversionValue(ADC1);
}
