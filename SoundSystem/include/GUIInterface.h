/*
GUIInterface.h
Author: Erik Sievers
*/

//Returns the level of the base in mDb in the interval[-20k, 20k].
float getBase(void);

//Returns the level of the middle in mDb in the interval[-20k, 20k].
float getMiddle(void);

//Returns the level of the treble in mDb in the interval[-20k, 20k].
float getTreble(void);

//Returns the upper limit of the base in hz.
short getBaseUpperLimit(void);

//Returns the lower limit of the middle in hz.
short getMiddleLowerLimit(void);

//Returns the upper limit of the middle in hz.
short getMiddleUpperLimit(void);

//Returns the Lower limit of the treble in hz.
short getTrebleLowerLimit(void);

//Returns true if muted is selected; otherwise false.
//bool isMuted(void);

//Returns true if echo is selected; otherwise false.
//bool isEchoEnabled(void);

//Returns true if inputbased is selected, false if outputbased. This defaults to false
//if echo is disabled.
//bool isInputBased(void);

//Returns the delay of the echo is ms.
short getEchoDelay(void);

//Returns the decay of the echo in the form x/0x1000. Returns x.
short getEchoDecay(void);
