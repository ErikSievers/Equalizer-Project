/*
	echo.c
*/

#include "echo.h"

#define BUFFER_SIZE 40000
static uint16_t sampleBuffer[BUFFER_SIZE];
static uint16_t bufferIterator;
static uint16_t improvementCounter;
static uint16_t noiseLength;

uint16_t echoEffect(uint16_t sample, uint16_t bufferSize, float strengthMult, _Bool fade)
{
	uint16_t delayedSample;	
	
		
	delayedSample = sampleBuffer[bufferIterator];
	
	if (fade)
		sampleBuffer[bufferIterator] = sample + delayedSample*strengthMult;
	else 
		sampleBuffer[bufferIterator] = sample;	
	
	bufferIterator++;
	if (bufferIterator >= bufferSize) 
		bufferIterator = 0;
		
	sample = sample + delayedSample*strengthMult;
	
	if(sample>0xfff)
		sample=0xfff;
	return sample;
}