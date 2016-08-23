/*
	soundBus.c
*/

#include "soundBus.h"
#include "stm32f4xx_spi.h"
#include "stm32f4xx_gpio.h"

#define I2S3_WS_PIN 	GPIO_Pin_4

#define I2S3_MCLK_PIN 	GPIO_Pin_7   
#define I2S3_SCLK_PIN 	GPIO_Pin_10  
#define I2S3_SD_PIN 		GPIO_Pin_12 

void enable_I2Spins(void);

void enable_I2S(void)
{
	I2S_InitTypeDef I2S_InitType;
	enable_I2Spins();
	I2S_InitType.I2S_AudioFreq = I2S_AudioFreq_22k;
	I2S_InitType.I2S_MCLKOutput = I2S_MCLKOutput_Enable;
	I2S_InitType.I2S_Mode = I2S_Mode_MasterTx;
	I2S_InitType.I2S_DataFormat = I2S_DataFormat_16b;
	I2S_InitType.I2S_Standard = I2S_Standard_Phillips;
	I2S_InitType.I2S_CPOL = I2S_CPOL_Low;
 
	I2S_Init(SPI3, &I2S_InitType);
	
	I2S_Cmd(SPI3, ENABLE);  
		
}

void enable_I2Spins(void)
{
	GPIO_InitTypeDef PinInitStruct;
	
	PinInitStruct.GPIO_Mode = GPIO_Mode_AF;
	PinInitStruct.GPIO_OType = GPIO_OType_PP;
	PinInitStruct.GPIO_Pin = I2S3_SCLK_PIN | I2S3_SD_PIN | I2S3_MCLK_PIN;
	PinInitStruct.GPIO_PuPd = GPIO_PuPd_NOPULL;
	PinInitStruct.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_Init(GPIOC, &PinInitStruct);
	
	PinInitStruct.GPIO_Pin = I2S3_WS_PIN;
	GPIO_Init(GPIOA, &PinInitStruct);
	
	GPIO_PinAFConfig(GPIOA, GPIO_PinSource4, GPIO_AF_SPI3);
	GPIO_PinAFConfig(GPIOC, GPIO_PinSource7, GPIO_AF_SPI3);
	GPIO_PinAFConfig(GPIOC, GPIO_PinSource10, GPIO_AF_SPI3);
	GPIO_PinAFConfig(GPIOC, GPIO_PinSource12, GPIO_AF_SPI3);
}
