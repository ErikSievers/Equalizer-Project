/*
	analogToDigital.h
*/
#ifndef ANALOG_TO_DIGITAL_H
#define ANALOG_TO_DIGITAL_H

#include <stdint.h>

void enable_ADC1(void);

uint16_t ADC1_startConversion(void);

#endif

