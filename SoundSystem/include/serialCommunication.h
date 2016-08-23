/*
	serialCommunication.h
*/
#ifndef SERIAL_COMMUNICATION_H
#define	SERIAL_COMMUNICATION_H

void enable_USART6(void);
void readFromPort(void);
void writeToPort(void);
short EqValues[7];
/*
EqValues[7]
* All volumes are expressed as integers. To get the proper level, divide by 0xFFFF and multiply by the value.
* 
[0] : Bass Volume
[1] : Mid Volume
[2] : Treble Volume
[3] : Bass Upper Limit/Mid Lower Limit
[4] : Mid Upper Limit/Treble Lower Limit
[5] : Controls echo and mute. Set bit15 to enable mute.
							  Set bit14 to enable echo.
							  Set bit13 to enable input based echo, clear to enable output based echo
							  bit0-bit10 indicates the amount of delay in MS. NOTE THAT THIS NEEDS TO BE CONTROLLED as we have limited memory.
[6] : Indicates the volume of the echo.
 * 
 */
#endif
