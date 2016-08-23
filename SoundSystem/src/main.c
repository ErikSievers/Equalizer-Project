/*
	main.c
*/

#include "analogToDigital.h"
#include "digitalToAnalog.h"
#include "serialCommunication.h"
#include "interruptController.h"
#include "GUIInterface.h"
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

void initSystem(void);
void initPeriphClocks(void);
void enable_debugLed(void);

#define ALL_PORTS RCC_AHB1Periph_GPIOA | RCC_AHB1Periph_GPIOB | RCC_AHB1Periph_GPIOC | RCC_AHB1Periph_GPIOD

int debugCounter;

//Interrupt handler for IRQ6, used for GUI communication
void USART6_IRQHandler(void){
	// Check to see if interrupt flag is set
	if(USART_GetITStatus(USART6, USART_IT_RXNE))
		readFromPort();
		

}

// Interrupt handler for TIM2
void TIM2_IRQHandler()
{	
	int sample;
	float decay;
	
	// Check to see if interrupt flag is set
	if (TIM_GetITStatus(TIM2, TIM_IT_Update) != RESET && (!isMuted()))
    {
				debugCounter++;
				if(debugCounter == 48000) {
					GPIO_ToggleBits(GPIOD, GPIO_Pin_12);
					debugCounter = 0;
				}
							
				ADC1_startConversion();	
				sample = ADC_GetConversionValue(ADC1);	
				sample -= 2040;
				
				sample /= 4;
				
				if(isEchoEnabled()){ 
					decay = ((unsigned short)getEchoDecay())/(0.9*0x8000);
					sample = echoEffect(sample,
										(getEchoDelay()*48),
										decay,
										!(isInputBased()));    // Fade effect is not implemented at the moment		
					
				}
				
				sample = equalize(sample);		
	

				sample += 2040;
				DAC_SetChannel2Data(DAC_Align_12b_R, sample);
				
				
				// Clear interrupt
				TIM_ClearITPendingBit(TIM2, TIM_IT_Update);
    }
}

int main(void)
{
	// Init all peripherals
	enable_debugLed();
	initSystem(); 
	
	// void setEqualizer(float cutoff_ls, float gain_ls, float cutoff_hs, float gain_hs, float cutoff_pf, float bandwidth_pf, float gain_pf);
	// setEqualizer(150, -5, 2000, -30, 600, 500, 15);	
	// Inifinity loop to keep the program going
	while(1)
	{
	}
}

void initSystem(void)
{
	initPeriphClocks();
	enable_DAC();
	enable_ADC1();	
	enable_TIM2();		
	enable_USART6();
	enable_Interrupts();
	setEqualizer(150, 0, 2000, 0, 600, 500, 0);
}

void initPeriphClocks(void)
{
	RCC_AHB1PeriphClockCmd(ALL_PORTS, ENABLE);
	RCC_PeriphClockCmd(RCC_ADC1, ENABLE);
	RCC_PeriphClockCmd(RCC_DAC, ENABLE);
	RCC_PeriphClockCmd(RCC_USART6, ENABLE);
	RCC_PeriphClockCmd(RCC_TIM2, ENABLE);  
}

void enable_debugLed(void)
{
	GPIO_InitTypeDef PinInitStruct;

	PinInitStruct.GPIO_Pin = GPIO_Pin_12;
	PinInitStruct.GPIO_Mode = GPIO_Mode_OUT;
	PinInitStruct.GPIO_PuPd = GPIO_PuPd_NOPULL;
	PinInitStruct.GPIO_OType = GPIO_OType_PP;
	PinInitStruct.GPIO_Speed = GPIO_High_Speed;
	
	GPIO_Init(GPIOD, &PinInitStruct);
	
}