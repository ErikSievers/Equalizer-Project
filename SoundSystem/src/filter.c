/*
	filter.c
*/

#include "filter.h"
#include <math.h>
#include <stdint.h>

#define PI 3.1415926
#define SAMPLE_FREQ 48000

// lowshelving constants & params
static float xh_ls[2];
static float boostCut_ls;
static float cutoffParam_ls;

// Peakfilter constants & params
static float xh_pf[2];
static float boostCut_pf;
static float cutoffParam_pf;
static float centerFreqParam_pf;

// Highshelving constants & params
static float xh_hs[2];
static float boostCut_hs;
static float cutoffParam_hs;

static float transformSignal(float x, float a1, float b1, float a2, float b2) 
{
	float diffM = (x - (b1 + a1) / 2) / (b1 - a1);		// How far from the mean of the original interval the sample is.
	return ((b2 + a2) / 2 + diffM * (b2 - a2));			// Add the distance from the mean to the mean of the new interval.
}

static void lowshelving_calcConst(float cutoffFreq, float gain) 
{	
	float normCutoff = 2 * cutoffFreq / SAMPLE_FREQ;
	float zeroFreqGain = pow(10, gain / 20);  
	
	boostCut_ls = zeroFreqGain - 1;
	
	if (gain >= 0)
		cutoffParam_ls = (tan(PI * normCutoff / 2) - 1) / (tan(PI * normCutoff / 2) + 1); //% boost
	else
		cutoffParam_ls = (tan(PI * normCutoff / 2) - zeroFreqGain) / (tan(PI * normCutoff / 2) + zeroFreqGain); // % cut	
	
	xh_ls[0] = 0;
	xh_ls[1] = 0;
} 

static float lowshelving(float x) 
{
	float xh_new = (float)(x - cutoffParam_ls * xh_ls[0]);
	float ap_y = cutoffParam_ls * xh_new + xh_ls[0];
	
	xh_ls[0] = xh_new;
	
	return 0.5 * boostCut_ls * (x + ap_y) + x; 
}

static void highshelving_calcConst(float cutoffFreq, float gain) 
{	
	float normCutoff = 2 * cutoffFreq / SAMPLE_FREQ;
	float zeroFreqGain = pow(10, gain / 20);  
	
	boostCut_hs = zeroFreqGain - 1;
	
	if (gain >= 0)
		cutoffParam_hs = (tan(PI * normCutoff / 2) - 1) / (tan(PI * normCutoff / 2) + 1); //% boost
	else
		cutoffParam_hs = (tan(PI * normCutoff / 2) - zeroFreqGain) / (tan(PI * normCutoff / 2) + zeroFreqGain); // % cut
		
	xh_hs[0]=0;
	xh_hs[1]=0;
}

static float highshelving(float x) 
{
	float xh_new = (float)(x - cutoffParam_hs * xh_hs[0]);
	float ap_y = cutoffParam_hs * xh_new + xh_hs[0];
	
	xh_hs[0] = xh_new;
	
	return 0.5 * boostCut_hs * (x - ap_y) + x; 
}

static void peakfilter_calcConst(float cutoffFreq, float bandwidth, float gain) 
{
	float normCutoff = 2 * cutoffFreq / SAMPLE_FREQ ;
	float normBandWidth = 2 * bandwidth / SAMPLE_FREQ ;
	float zeroFreqGain = pow(10, gain / 20); 
	
	boostCut_pf = zeroFreqGain - 1;
	
	if (gain >= 0)
		cutoffParam_pf = (tan(PI * normBandWidth / 2) - 1) / (tan(PI * normBandWidth / 2) + 1); //% boost
	else
		cutoffParam_pf = (tan(PI * normBandWidth / 2) - zeroFreqGain) / (tan(PI * normBandWidth / 2) + zeroFreqGain); //% cut
	
	centerFreqParam_pf = -cos(PI * normCutoff);
	xh_pf[0]=0;
	xh_pf[1]=0;
} 

static float peakfilter(float x) 
{
	float xh_new = x - centerFreqParam_pf * (1 - cutoffParam_pf) * xh_pf[0] + cutoffParam_pf * xh_pf[1];
	float ap_y = -cutoffParam_pf * xh_new + centerFreqParam_pf * (1 - cutoffParam_pf) * xh_pf[0] + xh_pf[1];
	
	xh_pf[0] = xh_new;
	xh_pf[1] = xh_pf[0];
	
	return 0.5 * boostCut_pf * (x - ap_y) + x;
}

static float checkSaturation(float sample)
{
	
	if (sample > 1.0)
		sample = 1;
	else if (sample < -1.0)
		sample = -1;
	return sample;
}

void setEqualizer(float cutoff_ls, float gain_ls, float cutoff_hs, float gain_hs, float cutoff_pf, float bandwidth_pf, float gain_pf)
{
	lowshelving_calcConst(cutoff_ls, gain_ls); 				// Bass
	peakfilter_calcConst(cutoff_pf, bandwidth_pf, gain_pf);	// Mid
	highshelving_calcConst(cutoff_hs, gain_hs);				// Treble
}

uint16_t equalize(uint16_t sample) 
{
	//float fSample = transformSignal ((float) sample, 0, 4095, -1, 1);
	float fSample = transformSignal ((float) sample, -2040, 2040, -1, 1);
	
	
	fSample = checkSaturation( lowshelving(fSample)  );
	fSample = checkSaturation( peakfilter(fSample)   );
	fSample = checkSaturation( highshelving(fSample) );
	
	//sample = (uint16_t)transformSignal(fSample,-1,1,0,4095);
	sample = (int)transformSignal(fSample,-1,1,-2040,2040);
	return sample;
}
