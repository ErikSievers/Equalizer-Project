/*
	externalDAC.h
*/

#include "externalDAC.h"
#include "stm32f4xx_gpio.h"
#include "controlBus.h"

#define CODEC_RESET_PIN GPIO_Pin_4
#define CODEC_MAP_PWR_CTRL1 0x02
#define CODEC_MAP_IF_CTRL1  0x06

void codec_ctrl_init(void);
void init_RESETPin(void);

void enable_externalDAC(void)
{
	init_RESETPin();
	GPIO_ResetBits(GPIOD, CODEC_RESET_PIN);
	codec_ctrl_init();
}

void init_RESETPin()
{
	GPIO_InitTypeDef PinInitStruct;

	PinInitStruct.GPIO_Pin = CODEC_RESET_PIN;
	PinInitStruct.GPIO_Mode = GPIO_Mode_OUT;
	PinInitStruct.GPIO_PuPd = GPIO_PuPd_DOWN;
	PinInitStruct.GPIO_OType = GPIO_OType_PP;
	PinInitStruct.GPIO_Speed = GPIO_Speed_50MHz;
	
	GPIO_Init(GPIOD, &PinInitStruct);
}

void codec_ctrl_init()
{

	uint8_t CodecCommandBuffer[5];

	GPIO_SetBits(GPIOD, CODEC_RESET_PIN);

	CodecCommandBuffer[0] = CODEC_MAP_IF_CTRL1;
	CodecCommandBuffer[1] = 0x07;
	send_codec_ctrl(CodecCommandBuffer, 2);


	CodecCommandBuffer[0] = CODEC_MAP_PWR_CTRL1;
	CodecCommandBuffer[1] = 0x9E;
	send_codec_ctrl(CodecCommandBuffer, 2);

}



