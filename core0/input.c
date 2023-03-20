
/*
#include "input.h"

#include "xgpio.h"
#include "xparameters.h"
#include "xscugic.h"
#include "xil_exception.h"
#include "xil_types.h"


#define INTC_DEVICE_ID 		XPAR_PS7_SCUGIC_0_DEVICE_ID
#define BTNS_DEVICE_ID		XPAR_AXI_GPIO_0_DEVICE_ID

#define INTC_GPIO_INTERRUPT_ID XPAR_FABRIC_AXI_GPIO_0_IP2INTC_IRPT_INTR

#define BTN_INT 			XGPIO_IR_CH1_MASK


XGpio BTNInst;
u32 inputDataPrevBuffer = 0x0;
u32 inputDataBuffer = 0x0;
XScuGic INTCInst;

void snake_HandleInterrupt(void *InstancePtr)
{
	XGpio_InterruptDisable(&BTNInst, BTN_INT);
	inputDataBuffer = XGpio_DiscreteRead(&BTNInst, 1);
	XGpio_InterruptClear(&BTNInst, BTN_INT);
	XGpio_InterruptEnable(&BTNInst, BTN_INT);
}

int InterruptSystemSetup(XScuGic *XScuGicInstancePtr)
{
	// Enable interrupt
	XGpio_InterruptEnable(&BTNInst, BTN_INT);
	XGpio_InterruptGlobalEnable(&BTNInst);

	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,
			 	 	 	 	 	 (Xil_ExceptionHandler)XScuGic_InterruptHandler,
			 	 	 	 	 	 XScuGicInstancePtr);
	Xil_ExceptionEnable();


	return XST_SUCCESS;

}

int IntcInitFunction(u16 DeviceId, XGpio *GpioInstancePtr)
{
	XScuGic_Config *IntcConfig;
	int status;

	// Interrupt controller initialisation
	IntcConfig = XScuGic_LookupConfig(DeviceId);
	status = XScuGic_CfgInitialize(&INTCInst, IntcConfig, IntcConfig->CpuBaseAddress);
	if(status != XST_SUCCESS) return XST_FAILURE;

	// Call to interrupt setup
	status = InterruptSystemSetup(&INTCInst);
	if(status != XST_SUCCESS) return XST_FAILURE;

	// Connect GPIO interrupt to handler
	status = XScuGic_Connect(&INTCInst,
					  	  	 INTC_GPIO_INTERRUPT_ID,
					  	  	 (Xil_ExceptionHandler)snake_HandleInterrupt,
					  	  	 (void *)GpioInstancePtr);
	if(status != XST_SUCCESS) return XST_FAILURE;

	// Enable GPIO interrupts interrupt
	XGpio_InterruptEnable(GpioInstancePtr, 1);
	XGpio_InterruptGlobalEnable(GpioInstancePtr);

	// Enable GPIO and timer interrupts in the controller
	XScuGic_Enable(&INTCInst, INTC_GPIO_INTERRUPT_ID);

	return XST_SUCCESS;
}

int snake_InitInterrupt()
{
	/*
	int status;
	bool success = TRUE;

	XScuGic INTCInst;

	status = XGpio_Initialize(&BTNInst, BTNS_DEVICE_ID);
	success &= XST_SUCCESS == status;

	XGpio_SetDataDirection(&BTNInst, 1, 0xFF);

	XScuGic_Config *IntcConfig;

	IntcConfig = XScuGic_LookupConfig(INTC_DEVICE_ID);
	status = XScuGic_CfgInitialize(&INTCInst, IntcConfig, IntcConfig->CpuBaseAddress);
	success &= XST_SUCCESS == status;

	XGpio_InterruptEnable(&BTNInst, BTN_INT);
	XGpio_InterruptGlobalEnable(&BTNInst);

	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT, (Xil_ExceptionHandler)XScuGic_InterruptHandler, &INTCInst);
	Xil_ExceptionEnable();

	status = XScuGic_Connect(&INTCInst, INTC_GPIO_INTERRUPT_ID, (Xil_ExceptionHandler)snake_HandleInterrupt, (void *)&BTNInst);
	success &= XST_SUCCESS == status;

	XGpio_InterruptEnable(&BTNInst, 1);
	XGpio_InterruptGlobalEnable(&BTNInst);

	XScuGic_Enable(&INTCInst, INTC_GPIO_INTERRUPT_ID);
	*./

	int status;
	//----------------------------------------------------
	// INITIALIZE THE PERIPHERALS & SET DIRECTIONS OF GPIO
	//----------------------------------------------------
	// Initialize Push Buttons
	status = XGpio_Initialize(&BTNInst, BTNS_DEVICE_ID);
	if(status != XST_SUCCESS) return XST_FAILURE;
	// Set all buttons direction to inputs
	XGpio_SetDataDirection(&BTNInst, 1, 0xFF);

	// Initialize interrupt controller
	status = IntcInitFunction(INTC_DEVICE_ID, &BTNInst);
	if(status != XST_SUCCESS) return XST_FAILURE;

	return XST_SUCCESS;
}

u32 snake_GetInputFlags()
{
	// stub
	u32 out = inputDataBuffer & ~inputDataPrevBuffer;
 	inputDataPrevBuffer = inputDataBuffer;
	return out;
}*/
