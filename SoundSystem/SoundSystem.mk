##
## Auto Generated makefile by CodeLite IDE
## any manual changes will be erased      
##
## Debug
ProjectName            :=SoundSystem
ConfigurationName      :=Debug
WorkspacePath          := "Z:\Git\Dat290\CodeLite_Workspace"
ProjectPath            := "Z:\Git\Dat290\CodeLite_Workspace\SoundSystem"
IntermediateDirectory  :=./Debug
OutDir                 := $(IntermediateDirectory)
CurrentFileName        :=
CurrentFilePath        :=
CurrentFileFullPath    :=
User                   :=aryani
Date                   :=10/14/14
CodeLitePath           :="C:\temp\program\CodeLite"
LinkerName             :=arm-none-eabi-gcc
SharedObjectLinkerName :=arm-none-eabi-g++ -shared -fPIC
ObjectSuffix           :=.o
DependSuffix           :=
PreprocessSuffix       :=.o.i
DebugSwitch            :=-g 
IncludeSwitch          :=-I
LibrarySwitch          :=-l
OutputSwitch           :=-o 
LibraryPathSwitch      :=-L
PreprocessorSwitch     :=-D
SourceSwitch           :=-c 
OutputFile             :=$(IntermediateDirectory)/$(ProjectName)
Preprocessors          :=$(PreprocessorSwitch)STM32F40_41xxx 
ObjectSwitch           :=-o 
ArchiveOutputSwitch    := 
PreprocessOnlySwitch   :=-E 
ObjectsFileList        :="SoundSystem.txt"
PCHCompileFlags        :=
MakeDirCommand         :=makedir
RcCmpOptions           := 
RcCompilerName         :=
LinkOptions            :=  -mthumb -o $(IntermediateDirectory)/$(ProjectName).elf -mcpu=cortex-m4 -nostartfiles -T$(ProjectDir)/stm32F4xx.ld -Wl,-Map=$(IntermediateDirectory)/$(ProjectName).map,--cref,-lm
IncludePath            :=  $(IncludeSwitch). $(IncludeSwitch). $(IncludeSwitch)$(ProjectPath)/include 
IncludePCH             := 
RcIncludePath          := 
Libs                   := 
ArLibs                 :=  
LibPath                := $(LibraryPathSwitch). 

##
## Common variables
## AR, CXX, CC, AS, CXXFLAGS and CFLAGS can be overriden using an environment variables
##
AR       := arm-none-eabi-ar rcus
CXX      := arm-none-eabi-g++
CC       := arm-none-eabi-gcc
CXXFLAGS :=  -g -O0 -Wall $(Preprocessors)
CFLAGS   :=  -g -O0 -gdwarf-2 -Wall -fverbose-asm -mthumb -mcpu=cortex-m4 $(Preprocessors)
ASFLAGS  := 
AS       := arm-none-eabi-as


##
## User defined environment variables
##
CodeLiteDir:=C:\temp\program\CodeLite
UNIT_TEST_PP_SRC_DIR:=C:\UnitTest++-1.3
Objects0=$(IntermediateDirectory)/src_main$(ObjectSuffix) $(IntermediateDirectory)/src_stm32f4xx_gpio$(ObjectSuffix) $(IntermediateDirectory)/src_stm32f4xx_rcc$(ObjectSuffix) $(IntermediateDirectory)/src_system_stm32f4xx_Discovery$(ObjectSuffix) $(IntermediateDirectory)/src_ADC$(ObjectSuffix) $(IntermediateDirectory)/src_analogToDigital$(ObjectSuffix) $(IntermediateDirectory)/src_DAC$(ObjectSuffix) $(IntermediateDirectory)/src_digitalToAnalog$(ObjectSuffix) $(IntermediateDirectory)/src_GPIO$(ObjectSuffix) $(IntermediateDirectory)/src_interruptController$(ObjectSuffix) \
	$(IntermediateDirectory)/src_NVIC$(ObjectSuffix) $(IntermediateDirectory)/src_RCC$(ObjectSuffix) $(IntermediateDirectory)/src_serialCommunication$(ObjectSuffix) $(IntermediateDirectory)/src_stm32f4xx_adc$(ObjectSuffix) $(IntermediateDirectory)/src_stm32f4xx_dac$(ObjectSuffix) $(IntermediateDirectory)/src_stm32f4xx_tim$(ObjectSuffix) $(IntermediateDirectory)/src_stm32f4xx_usart$(ObjectSuffix) $(IntermediateDirectory)/src_TIM$(ObjectSuffix) $(IntermediateDirectory)/src_timer$(ObjectSuffix) $(IntermediateDirectory)/src_USART$(ObjectSuffix) \
	$(IntermediateDirectory)/src_misc$(ObjectSuffix) $(IntermediateDirectory)/src_echo$(ObjectSuffix) $(IntermediateDirectory)/src_filter$(ObjectSuffix) $(IntermediateDirectory)/src_controlBus$(ObjectSuffix) $(IntermediateDirectory)/src_externalDAC$(ObjectSuffix) $(IntermediateDirectory)/src_soundBus$(ObjectSuffix) $(IntermediateDirectory)/src_stm32f4xx_i2c$(ObjectSuffix) $(IntermediateDirectory)/src_stm32f4xx_spi$(ObjectSuffix) $(IntermediateDirectory)/src_GUIInterface$(ObjectSuffix) $(IntermediateDirectory)/resources_startup_stm32f40xx$(ObjectSuffix) \
	



Objects=$(Objects0) 

##
## Main Build Targets 
##
.PHONY: all clean PreBuild PrePreBuild PostBuild
all: $(OutputFile)

$(OutputFile): $(IntermediateDirectory)/.d $(Objects) 
	@$(MakeDirCommand) $(@D)
	@echo "" > $(IntermediateDirectory)/.d
	@echo $(Objects0)  > $(ObjectsFileList)
	$(LinkerName) $(OutputSwitch)$(OutputFile) @$(ObjectsFileList) $(LibPath) $(Libs) $(LinkOptions)

PostBuild:
	@echo Executing Post Build commands ...
	arm-none-eabi-objcopy -S -O binary $(IntermediateDirectory)/$(ProjectName).elf $(IntermediateDirectory)/$(ProjectName).bin
	@echo Done

$(IntermediateDirectory)/.d:
	@$(MakeDirCommand) "./Debug"

PreBuild:


##
## Objects
##
$(IntermediateDirectory)/src_main$(ObjectSuffix): src/main.c 
	$(CC) $(SourceSwitch) "Z:/Git/Dat290/CodeLite_Workspace/SoundSystem/src/main.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_main$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_main$(PreprocessSuffix): src/main.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_main$(PreprocessSuffix) "src/main.c"

$(IntermediateDirectory)/src_stm32f4xx_gpio$(ObjectSuffix): src/stm32f4xx_gpio.c 
	$(CC) $(SourceSwitch) "Z:/Git/Dat290/CodeLite_Workspace/SoundSystem/src/stm32f4xx_gpio.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_stm32f4xx_gpio$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_stm32f4xx_gpio$(PreprocessSuffix): src/stm32f4xx_gpio.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_stm32f4xx_gpio$(PreprocessSuffix) "src/stm32f4xx_gpio.c"

$(IntermediateDirectory)/src_stm32f4xx_rcc$(ObjectSuffix): src/stm32f4xx_rcc.c 
	$(CC) $(SourceSwitch) "Z:/Git/Dat290/CodeLite_Workspace/SoundSystem/src/stm32f4xx_rcc.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_stm32f4xx_rcc$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_stm32f4xx_rcc$(PreprocessSuffix): src/stm32f4xx_rcc.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_stm32f4xx_rcc$(PreprocessSuffix) "src/stm32f4xx_rcc.c"

$(IntermediateDirectory)/src_system_stm32f4xx_Discovery$(ObjectSuffix): src/system_stm32f4xx_Discovery.c 
	$(CC) $(SourceSwitch) "Z:/Git/Dat290/CodeLite_Workspace/SoundSystem/src/system_stm32f4xx_Discovery.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_system_stm32f4xx_Discovery$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_system_stm32f4xx_Discovery$(PreprocessSuffix): src/system_stm32f4xx_Discovery.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_system_stm32f4xx_Discovery$(PreprocessSuffix) "src/system_stm32f4xx_Discovery.c"

$(IntermediateDirectory)/src_ADC$(ObjectSuffix): src/ADC.c 
	$(CC) $(SourceSwitch) "Z:/Git/Dat290/CodeLite_Workspace/SoundSystem/src/ADC.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_ADC$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_ADC$(PreprocessSuffix): src/ADC.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_ADC$(PreprocessSuffix) "src/ADC.c"

$(IntermediateDirectory)/src_analogToDigital$(ObjectSuffix): src/analogToDigital.c 
	$(CC) $(SourceSwitch) "Z:/Git/Dat290/CodeLite_Workspace/SoundSystem/src/analogToDigital.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_analogToDigital$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_analogToDigital$(PreprocessSuffix): src/analogToDigital.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_analogToDigital$(PreprocessSuffix) "src/analogToDigital.c"

$(IntermediateDirectory)/src_DAC$(ObjectSuffix): src/DAC.c 
	$(CC) $(SourceSwitch) "Z:/Git/Dat290/CodeLite_Workspace/SoundSystem/src/DAC.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_DAC$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_DAC$(PreprocessSuffix): src/DAC.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_DAC$(PreprocessSuffix) "src/DAC.c"

$(IntermediateDirectory)/src_digitalToAnalog$(ObjectSuffix): src/digitalToAnalog.c 
	$(CC) $(SourceSwitch) "Z:/Git/Dat290/CodeLite_Workspace/SoundSystem/src/digitalToAnalog.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_digitalToAnalog$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_digitalToAnalog$(PreprocessSuffix): src/digitalToAnalog.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_digitalToAnalog$(PreprocessSuffix) "src/digitalToAnalog.c"

$(IntermediateDirectory)/src_GPIO$(ObjectSuffix): src/GPIO.c 
	$(CC) $(SourceSwitch) "Z:/Git/Dat290/CodeLite_Workspace/SoundSystem/src/GPIO.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_GPIO$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_GPIO$(PreprocessSuffix): src/GPIO.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_GPIO$(PreprocessSuffix) "src/GPIO.c"

$(IntermediateDirectory)/src_interruptController$(ObjectSuffix): src/interruptController.c 
	$(CC) $(SourceSwitch) "Z:/Git/Dat290/CodeLite_Workspace/SoundSystem/src/interruptController.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_interruptController$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_interruptController$(PreprocessSuffix): src/interruptController.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_interruptController$(PreprocessSuffix) "src/interruptController.c"

$(IntermediateDirectory)/src_NVIC$(ObjectSuffix): src/NVIC.c 
	$(CC) $(SourceSwitch) "Z:/Git/Dat290/CodeLite_Workspace/SoundSystem/src/NVIC.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_NVIC$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_NVIC$(PreprocessSuffix): src/NVIC.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_NVIC$(PreprocessSuffix) "src/NVIC.c"

$(IntermediateDirectory)/src_RCC$(ObjectSuffix): src/RCC.c 
	$(CC) $(SourceSwitch) "Z:/Git/Dat290/CodeLite_Workspace/SoundSystem/src/RCC.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_RCC$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_RCC$(PreprocessSuffix): src/RCC.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_RCC$(PreprocessSuffix) "src/RCC.c"

$(IntermediateDirectory)/src_serialCommunication$(ObjectSuffix): src/serialCommunication.c 
	$(CC) $(SourceSwitch) "Z:/Git/Dat290/CodeLite_Workspace/SoundSystem/src/serialCommunication.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_serialCommunication$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_serialCommunication$(PreprocessSuffix): src/serialCommunication.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_serialCommunication$(PreprocessSuffix) "src/serialCommunication.c"

$(IntermediateDirectory)/src_stm32f4xx_adc$(ObjectSuffix): src/stm32f4xx_adc.c 
	$(CC) $(SourceSwitch) "Z:/Git/Dat290/CodeLite_Workspace/SoundSystem/src/stm32f4xx_adc.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_stm32f4xx_adc$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_stm32f4xx_adc$(PreprocessSuffix): src/stm32f4xx_adc.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_stm32f4xx_adc$(PreprocessSuffix) "src/stm32f4xx_adc.c"

$(IntermediateDirectory)/src_stm32f4xx_dac$(ObjectSuffix): src/stm32f4xx_dac.c 
	$(CC) $(SourceSwitch) "Z:/Git/Dat290/CodeLite_Workspace/SoundSystem/src/stm32f4xx_dac.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_stm32f4xx_dac$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_stm32f4xx_dac$(PreprocessSuffix): src/stm32f4xx_dac.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_stm32f4xx_dac$(PreprocessSuffix) "src/stm32f4xx_dac.c"

$(IntermediateDirectory)/src_stm32f4xx_tim$(ObjectSuffix): src/stm32f4xx_tim.c 
	$(CC) $(SourceSwitch) "Z:/Git/Dat290/CodeLite_Workspace/SoundSystem/src/stm32f4xx_tim.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_stm32f4xx_tim$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_stm32f4xx_tim$(PreprocessSuffix): src/stm32f4xx_tim.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_stm32f4xx_tim$(PreprocessSuffix) "src/stm32f4xx_tim.c"

$(IntermediateDirectory)/src_stm32f4xx_usart$(ObjectSuffix): src/stm32f4xx_usart.c 
	$(CC) $(SourceSwitch) "Z:/Git/Dat290/CodeLite_Workspace/SoundSystem/src/stm32f4xx_usart.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_stm32f4xx_usart$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_stm32f4xx_usart$(PreprocessSuffix): src/stm32f4xx_usart.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_stm32f4xx_usart$(PreprocessSuffix) "src/stm32f4xx_usart.c"

$(IntermediateDirectory)/src_TIM$(ObjectSuffix): src/TIM.c 
	$(CC) $(SourceSwitch) "Z:/Git/Dat290/CodeLite_Workspace/SoundSystem/src/TIM.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_TIM$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_TIM$(PreprocessSuffix): src/TIM.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_TIM$(PreprocessSuffix) "src/TIM.c"

$(IntermediateDirectory)/src_timer$(ObjectSuffix): src/timer.c 
	$(CC) $(SourceSwitch) "Z:/Git/Dat290/CodeLite_Workspace/SoundSystem/src/timer.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_timer$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_timer$(PreprocessSuffix): src/timer.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_timer$(PreprocessSuffix) "src/timer.c"

$(IntermediateDirectory)/src_USART$(ObjectSuffix): src/USART.c 
	$(CC) $(SourceSwitch) "Z:/Git/Dat290/CodeLite_Workspace/SoundSystem/src/USART.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_USART$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_USART$(PreprocessSuffix): src/USART.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_USART$(PreprocessSuffix) "src/USART.c"

$(IntermediateDirectory)/src_misc$(ObjectSuffix): src/misc.c 
	$(CC) $(SourceSwitch) "Z:/Git/Dat290/CodeLite_Workspace/SoundSystem/src/misc.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_misc$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_misc$(PreprocessSuffix): src/misc.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_misc$(PreprocessSuffix) "src/misc.c"

$(IntermediateDirectory)/src_echo$(ObjectSuffix): src/echo.c 
	$(CC) $(SourceSwitch) "Z:/Git/Dat290/CodeLite_Workspace/SoundSystem/src/echo.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_echo$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_echo$(PreprocessSuffix): src/echo.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_echo$(PreprocessSuffix) "src/echo.c"

$(IntermediateDirectory)/src_filter$(ObjectSuffix): src/filter.c 
	$(CC) $(SourceSwitch) "Z:/Git/Dat290/CodeLite_Workspace/SoundSystem/src/filter.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_filter$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_filter$(PreprocessSuffix): src/filter.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_filter$(PreprocessSuffix) "src/filter.c"

$(IntermediateDirectory)/src_controlBus$(ObjectSuffix): src/controlBus.c 
	$(CC) $(SourceSwitch) "Z:/Git/Dat290/CodeLite_Workspace/SoundSystem/src/controlBus.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_controlBus$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_controlBus$(PreprocessSuffix): src/controlBus.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_controlBus$(PreprocessSuffix) "src/controlBus.c"

$(IntermediateDirectory)/src_externalDAC$(ObjectSuffix): src/externalDAC.c 
	$(CC) $(SourceSwitch) "Z:/Git/Dat290/CodeLite_Workspace/SoundSystem/src/externalDAC.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_externalDAC$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_externalDAC$(PreprocessSuffix): src/externalDAC.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_externalDAC$(PreprocessSuffix) "src/externalDAC.c"

$(IntermediateDirectory)/src_soundBus$(ObjectSuffix): src/soundBus.c 
	$(CC) $(SourceSwitch) "Z:/Git/Dat290/CodeLite_Workspace/SoundSystem/src/soundBus.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_soundBus$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_soundBus$(PreprocessSuffix): src/soundBus.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_soundBus$(PreprocessSuffix) "src/soundBus.c"

$(IntermediateDirectory)/src_stm32f4xx_i2c$(ObjectSuffix): src/stm32f4xx_i2c.c 
	$(CC) $(SourceSwitch) "Z:/Git/Dat290/CodeLite_Workspace/SoundSystem/src/stm32f4xx_i2c.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_stm32f4xx_i2c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_stm32f4xx_i2c$(PreprocessSuffix): src/stm32f4xx_i2c.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_stm32f4xx_i2c$(PreprocessSuffix) "src/stm32f4xx_i2c.c"

$(IntermediateDirectory)/src_stm32f4xx_spi$(ObjectSuffix): src/stm32f4xx_spi.c 
	$(CC) $(SourceSwitch) "Z:/Git/Dat290/CodeLite_Workspace/SoundSystem/src/stm32f4xx_spi.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_stm32f4xx_spi$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_stm32f4xx_spi$(PreprocessSuffix): src/stm32f4xx_spi.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_stm32f4xx_spi$(PreprocessSuffix) "src/stm32f4xx_spi.c"

$(IntermediateDirectory)/src_GUIInterface$(ObjectSuffix): src/GUIInterface.c 
	$(CC) $(SourceSwitch) "Z:/Git/Dat290/CodeLite_Workspace/SoundSystem/src/GUIInterface.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_GUIInterface$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_GUIInterface$(PreprocessSuffix): src/GUIInterface.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_GUIInterface$(PreprocessSuffix) "src/GUIInterface.c"

$(IntermediateDirectory)/resources_startup_stm32f40xx$(ObjectSuffix): resources/startup_stm32f40xx.s 
	$(AS) "Z:/Git/Dat290/CodeLite_Workspace/SoundSystem/resources/startup_stm32f40xx.s" $(ASFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/resources_startup_stm32f40xx$(ObjectSuffix) -I$(IncludePath)
$(IntermediateDirectory)/resources_startup_stm32f40xx$(PreprocessSuffix): resources/startup_stm32f40xx.s
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/resources_startup_stm32f40xx$(PreprocessSuffix) "resources/startup_stm32f40xx.s"

##
## Clean
##
clean:
	$(RM) $(IntermediateDirectory)/src_main$(ObjectSuffix)
	$(RM) $(IntermediateDirectory)/src_main$(DependSuffix)
	$(RM) $(IntermediateDirectory)/src_main$(PreprocessSuffix)
	$(RM) $(IntermediateDirectory)/src_stm32f4xx_gpio$(ObjectSuffix)
	$(RM) $(IntermediateDirectory)/src_stm32f4xx_gpio$(DependSuffix)
	$(RM) $(IntermediateDirectory)/src_stm32f4xx_gpio$(PreprocessSuffix)
	$(RM) $(IntermediateDirectory)/src_stm32f4xx_rcc$(ObjectSuffix)
	$(RM) $(IntermediateDirectory)/src_stm32f4xx_rcc$(DependSuffix)
	$(RM) $(IntermediateDirectory)/src_stm32f4xx_rcc$(PreprocessSuffix)
	$(RM) $(IntermediateDirectory)/src_system_stm32f4xx_Discovery$(ObjectSuffix)
	$(RM) $(IntermediateDirectory)/src_system_stm32f4xx_Discovery$(DependSuffix)
	$(RM) $(IntermediateDirectory)/src_system_stm32f4xx_Discovery$(PreprocessSuffix)
	$(RM) $(IntermediateDirectory)/src_ADC$(ObjectSuffix)
	$(RM) $(IntermediateDirectory)/src_ADC$(DependSuffix)
	$(RM) $(IntermediateDirectory)/src_ADC$(PreprocessSuffix)
	$(RM) $(IntermediateDirectory)/src_analogToDigital$(ObjectSuffix)
	$(RM) $(IntermediateDirectory)/src_analogToDigital$(DependSuffix)
	$(RM) $(IntermediateDirectory)/src_analogToDigital$(PreprocessSuffix)
	$(RM) $(IntermediateDirectory)/src_DAC$(ObjectSuffix)
	$(RM) $(IntermediateDirectory)/src_DAC$(DependSuffix)
	$(RM) $(IntermediateDirectory)/src_DAC$(PreprocessSuffix)
	$(RM) $(IntermediateDirectory)/src_digitalToAnalog$(ObjectSuffix)
	$(RM) $(IntermediateDirectory)/src_digitalToAnalog$(DependSuffix)
	$(RM) $(IntermediateDirectory)/src_digitalToAnalog$(PreprocessSuffix)
	$(RM) $(IntermediateDirectory)/src_GPIO$(ObjectSuffix)
	$(RM) $(IntermediateDirectory)/src_GPIO$(DependSuffix)
	$(RM) $(IntermediateDirectory)/src_GPIO$(PreprocessSuffix)
	$(RM) $(IntermediateDirectory)/src_interruptController$(ObjectSuffix)
	$(RM) $(IntermediateDirectory)/src_interruptController$(DependSuffix)
	$(RM) $(IntermediateDirectory)/src_interruptController$(PreprocessSuffix)
	$(RM) $(IntermediateDirectory)/src_NVIC$(ObjectSuffix)
	$(RM) $(IntermediateDirectory)/src_NVIC$(DependSuffix)
	$(RM) $(IntermediateDirectory)/src_NVIC$(PreprocessSuffix)
	$(RM) $(IntermediateDirectory)/src_RCC$(ObjectSuffix)
	$(RM) $(IntermediateDirectory)/src_RCC$(DependSuffix)
	$(RM) $(IntermediateDirectory)/src_RCC$(PreprocessSuffix)
	$(RM) $(IntermediateDirectory)/src_serialCommunication$(ObjectSuffix)
	$(RM) $(IntermediateDirectory)/src_serialCommunication$(DependSuffix)
	$(RM) $(IntermediateDirectory)/src_serialCommunication$(PreprocessSuffix)
	$(RM) $(IntermediateDirectory)/src_stm32f4xx_adc$(ObjectSuffix)
	$(RM) $(IntermediateDirectory)/src_stm32f4xx_adc$(DependSuffix)
	$(RM) $(IntermediateDirectory)/src_stm32f4xx_adc$(PreprocessSuffix)
	$(RM) $(IntermediateDirectory)/src_stm32f4xx_dac$(ObjectSuffix)
	$(RM) $(IntermediateDirectory)/src_stm32f4xx_dac$(DependSuffix)
	$(RM) $(IntermediateDirectory)/src_stm32f4xx_dac$(PreprocessSuffix)
	$(RM) $(IntermediateDirectory)/src_stm32f4xx_tim$(ObjectSuffix)
	$(RM) $(IntermediateDirectory)/src_stm32f4xx_tim$(DependSuffix)
	$(RM) $(IntermediateDirectory)/src_stm32f4xx_tim$(PreprocessSuffix)
	$(RM) $(IntermediateDirectory)/src_stm32f4xx_usart$(ObjectSuffix)
	$(RM) $(IntermediateDirectory)/src_stm32f4xx_usart$(DependSuffix)
	$(RM) $(IntermediateDirectory)/src_stm32f4xx_usart$(PreprocessSuffix)
	$(RM) $(IntermediateDirectory)/src_TIM$(ObjectSuffix)
	$(RM) $(IntermediateDirectory)/src_TIM$(DependSuffix)
	$(RM) $(IntermediateDirectory)/src_TIM$(PreprocessSuffix)
	$(RM) $(IntermediateDirectory)/src_timer$(ObjectSuffix)
	$(RM) $(IntermediateDirectory)/src_timer$(DependSuffix)
	$(RM) $(IntermediateDirectory)/src_timer$(PreprocessSuffix)
	$(RM) $(IntermediateDirectory)/src_USART$(ObjectSuffix)
	$(RM) $(IntermediateDirectory)/src_USART$(DependSuffix)
	$(RM) $(IntermediateDirectory)/src_USART$(PreprocessSuffix)
	$(RM) $(IntermediateDirectory)/src_misc$(ObjectSuffix)
	$(RM) $(IntermediateDirectory)/src_misc$(DependSuffix)
	$(RM) $(IntermediateDirectory)/src_misc$(PreprocessSuffix)
	$(RM) $(IntermediateDirectory)/src_echo$(ObjectSuffix)
	$(RM) $(IntermediateDirectory)/src_echo$(DependSuffix)
	$(RM) $(IntermediateDirectory)/src_echo$(PreprocessSuffix)
	$(RM) $(IntermediateDirectory)/src_filter$(ObjectSuffix)
	$(RM) $(IntermediateDirectory)/src_filter$(DependSuffix)
	$(RM) $(IntermediateDirectory)/src_filter$(PreprocessSuffix)
	$(RM) $(IntermediateDirectory)/src_controlBus$(ObjectSuffix)
	$(RM) $(IntermediateDirectory)/src_controlBus$(DependSuffix)
	$(RM) $(IntermediateDirectory)/src_controlBus$(PreprocessSuffix)
	$(RM) $(IntermediateDirectory)/src_externalDAC$(ObjectSuffix)
	$(RM) $(IntermediateDirectory)/src_externalDAC$(DependSuffix)
	$(RM) $(IntermediateDirectory)/src_externalDAC$(PreprocessSuffix)
	$(RM) $(IntermediateDirectory)/src_soundBus$(ObjectSuffix)
	$(RM) $(IntermediateDirectory)/src_soundBus$(DependSuffix)
	$(RM) $(IntermediateDirectory)/src_soundBus$(PreprocessSuffix)
	$(RM) $(IntermediateDirectory)/src_stm32f4xx_i2c$(ObjectSuffix)
	$(RM) $(IntermediateDirectory)/src_stm32f4xx_i2c$(DependSuffix)
	$(RM) $(IntermediateDirectory)/src_stm32f4xx_i2c$(PreprocessSuffix)
	$(RM) $(IntermediateDirectory)/src_stm32f4xx_spi$(ObjectSuffix)
	$(RM) $(IntermediateDirectory)/src_stm32f4xx_spi$(DependSuffix)
	$(RM) $(IntermediateDirectory)/src_stm32f4xx_spi$(PreprocessSuffix)
	$(RM) $(IntermediateDirectory)/src_GUIInterface$(ObjectSuffix)
	$(RM) $(IntermediateDirectory)/src_GUIInterface$(DependSuffix)
	$(RM) $(IntermediateDirectory)/src_GUIInterface$(PreprocessSuffix)
	$(RM) $(IntermediateDirectory)/resources_startup_stm32f40xx$(ObjectSuffix)
	$(RM) $(IntermediateDirectory)/resources_startup_stm32f40xx$(DependSuffix)
	$(RM) $(IntermediateDirectory)/resources_startup_stm32f40xx$(PreprocessSuffix)
	$(RM) $(OutputFile)
	$(RM) $(OutputFile).exe
	$(RM) "../.build-debug/SoundSystem"


