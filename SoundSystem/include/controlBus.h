/*
	controlBus.h
*/
#ifndef CONTROL_BUS_H
#define CONTROL_BUS_H

#include <stdint.h>

void enable_I2C(void);

void send_codec_ctrl(uint8_t controlBytes[], uint8_t numBytes);

#endif
