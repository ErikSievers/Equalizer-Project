/*
	echo.h
*/
#ifndef ECHO_H
#define ECHO_H

#include <stdbool.h>
#include <stdint.h>

uint16_t echoEffect(uint16_t sample, 
					uint16_t bufferSize, 
					float strengthMult, 
					_Bool fade);

#endif