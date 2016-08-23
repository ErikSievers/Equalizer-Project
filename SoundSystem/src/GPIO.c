/*
   GPIO.c
*/



#include <GPIO.h>

//Init GPIO
void init_GPIO(GPIO_TypeDef* GPIOx,
               uint32_t GPIO_Pin,
               GPIOMode_TypeDef GPIO_Mode,
               GPIOSpeed_TypeDef GPIO_Speed,
               GPIOOType_TypeDef GPIO_OType,
               GPIOPuPd_TypeDef GPIO_PuPd)
{
   GPIO_InitTypeDef GPIO_InitStructure; //setup GPIO_InitStructure

   GPIO_DeInit(GPIOx);

   GPIO_InitStructure.GPIO_Pin = GPIO_Pin;
   GPIO_InitStructure.GPIO_Mode = GPIO_Mode;
   GPIO_InitStructure.GPIO_Speed = GPIO_Speed;
   GPIO_InitStructure.GPIO_OType = GPIO_OType;
   GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd;

   GPIO_Init(GPIOx, &GPIO_InitStructure);
}
