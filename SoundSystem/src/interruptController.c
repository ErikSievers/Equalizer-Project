/*
	interruptController.c
*/

#include "interruptController.h"
#include "NVIC.h"
#include "TIM.h"
#include "USART.h"
void enable_Interrupts(void)
{
	// Enable interrupts for TIM2
	init_IRQ_Channel( 	TIM2_IRQn,
						0,  				// ChannelPreemptionPriority
						1,  				// ChannelSubPriority
						ENABLE);			// ChannelCmd
	
	TIM_ITConfig(TIM2, TIM_IT_Update, ENABLE);
	
	// Enable interrupts for for USART6 when data is received
	init_IRQ_Channel( 	USART6_IRQn,
						0,  				// ChannelPreemptionPriority
						1,  				// ChannelSubPriority
						ENABLE);			// ChannelCmd
	
	USART_ITConfig(USART6, USART_IT_RXNE, ENABLE);
}
