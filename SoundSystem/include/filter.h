/*
	filter.h
*/
#ifndef FILTER_H
#define FILTER_H

#include <stdint.h>

void setEqualizer(float cutoff_ls, float gain_ls, float cutoff_hs, float gain_hs, float cutoff_pf, float bandwidth_pf, float gain_pf);
uint16_t equalize(uint16_t sample);

#endif
