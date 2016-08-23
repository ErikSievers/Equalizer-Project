/*
	timer.c
*/

#include "timer.h"
#include "TIM.h"

#define TIM2_FREQ 	84000000
#define SAMPLE_FREQ	48000

void enable_TIM2()
{
	init_TIM_TimeBase(	TIM2, 
						0,								// Prescaler
						TIM_CounterMode_Up, 
						TIM2_FREQ/SAMPLE_FREQ,			// Period
						TIM_CKD_DIV1,					// ClockDivision
						0);								// RepetitionCounter
		
	TIM_SelectOutputTrigger(TIM2, TIM_TRGOSource_Update);
	
	// Enable timer
	TIM_Cmd(TIM2, ENABLE);
	
}
