/*
	controlBus.c
*/

#include "controlBus.h"
#include "stm32f4xx_i2c.h"
#include "stm32f4xx_gpio.h"

#define I2C_SCL_PIN		GPIO_Pin_6  
#define I2C_SDA_PIN		GPIO_Pin_9

#define CODEC_I2C I2C1
#define CODEC_I2C_ADDRESS 0x94

void enable_I2CPins(void);

void enable_I2C(void)
{
	I2C_InitTypeDef I2C_InitType;
	
	enable_I2CPins();

	I2C_InitType.I2C_ClockSpeed = 100000;
	I2C_InitType.I2C_Mode = I2C_Mode_I2C;
	I2C_InitType.I2C_OwnAddress1 = 99;
	I2C_InitType.I2C_Ack = I2C_Ack_Enable;
	I2C_InitType.I2C_AcknowledgedAddress = I2C_AcknowledgedAddress_7bit;
	I2C_InitType.I2C_DutyCycle = I2C_DutyCycle_2;
	
	I2C_Init(I2C1, &I2C_InitType);   
	I2C_Cmd(I2C1, ENABLE); 
}

void enable_I2CPins(void)
{
	GPIO_InitTypeDef PinInitStruct;
	
	PinInitStruct.GPIO_Mode = GPIO_Mode_AF;
	PinInitStruct.GPIO_OType = GPIO_OType_OD;
	PinInitStruct.GPIO_Pin = I2C_SCL_PIN | I2C_SDA_PIN;
	PinInitStruct.GPIO_PuPd = GPIO_PuPd_NOPULL;
	PinInitStruct.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_Init(GPIOB, &PinInitStruct);
	
	GPIO_PinAFConfig(GPIOB, GPIO_PinSource6, GPIO_AF_I2C1);
	GPIO_PinAFConfig(GPIOB, GPIO_PinSource9, GPIO_AF_I2C1); 
}

void send_codec_ctrl(uint8_t controlBytes[], uint8_t numBytes)
{
	uint8_t bytesSent=0;

	while (I2C_GetFlagStatus(CODEC_I2C, I2C_FLAG_BUSY));

	I2C_GenerateSTART(CODEC_I2C, ENABLE);
	while (!I2C_GetFlagStatus(CODEC_I2C, I2C_FLAG_SB));

	I2C_Send7bitAddress(CODEC_I2C, CODEC_I2C_ADDRESS, I2C_Direction_Transmitter);
	while (!I2C_CheckEvent(CODEC_I2C, I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED));

	while (bytesSent < numBytes)
	{
		I2C_SendData(CODEC_I2C, controlBytes[bytesSent]);
		bytesSent++;
		while (!I2C_CheckEvent(CODEC_I2C, I2C_EVENT_MASTER_BYTE_TRANSMITTING));
	}
	while(!I2C_GetFlagStatus(CODEC_I2C, I2C_FLAG_BTF));

	I2C_GenerateSTOP(CODEC_I2C, ENABLE);

}


