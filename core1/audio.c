/*
 * audio.c
 *
 *  Contains all of the functions related to audio codec setup.
 */

#include "audio.h"
#include <atomic>
#include <vector>

#include "audio_sources.h"

XIicPs Iic;
unsigned int VOLUME = 1;
unsigned int SOUND_EFFECT_VOLUME = 3;

#define VOL_VAL (*(/*volatile*/ std::atomic<unsigned int> *)(0xFFFF0000))
#define MENU_VAL (*(/*volatile*/ std::atomic<unsigned int> *)(0xFFFF0004))
#define CRASH_VAL (*(/*volatile*/ std::atomic<unsigned int> *)(0xFFFF0008))
#define CONSUME_VAL (*(/*volatile*/ std::atomic<unsigned int> *)(0xFFFF000C))

u32* audiobuffers[8];



int main() {
	//Configure the IIC data structure
	IicConfig(XPAR_XIICPS_0_DEVICE_ID);

	//Configure the Audio Codec's PLL
	AudioPllConfig();

	//Configure the Line in and Line out ports.
	//Call LineInLineOutConfig() for a configuration that
	//enables the HP jack too.
	AudioConfigureJacks();

	audioPlay();
	return XST_SUCCESS;
}

void audioPlay() {
	audiobuffers[0] = left_background_audio;
	audiobuffers[1] = right_background_audio;
	audiobuffers[2] = left_menu_buttons_audio;
	audiobuffers[3] = right_menu_buttons_audio;
	audiobuffers[4] = left_gameover_audio;
	audiobuffers[5] = right_gameover_audio;
	audiobuffers[6] = left_consume_apple_audio;
	audiobuffers[7] = right_consume_apple_audio;

	audio_playback_file(audiobuffers);

}


void audio_playback_file(u32** audiobuffers){
	std::vector<u32> menu_iterators;
	std::vector<u32> consume_iterators;
	std::vector<u32> crash_iterators;
	u32 curr_output_left;
	u32 curr_output_right;

	while(1){
		for(u32 i=0; i<background_size; i++){

			VOLUME = VOL_VAL.load();

			curr_output_left = audiobuffers[0][i] * VOLUME;
			curr_output_right = audiobuffers[1][i] * VOLUME;

			if (MENU_VAL.load() == 1 /*&& menu_iter < menu_buttons_size*/){

				menu_iterators.push_back(0);
				MENU_VAL.store(0);
			}
			for (u32 j = 0; j < menu_iterators.size(); j++){
				curr_output_left = curr_output_left + audiobuffers[2][menu_iterators[j]] * SOUND_EFFECT_VOLUME;
				curr_output_right = curr_output_right + audiobuffers[3][menu_iterators[j]] * SOUND_EFFECT_VOLUME;
				menu_iterators[j] = menu_iterators[j] + 1;
				if (menu_iterators[j] == menu_buttons_size - 1){
					menu_iterators.erase(menu_iterators.begin()+j);
					j--;
				}
			}

			if (CRASH_VAL.load() == 1){

				crash_iterators.push_back(0);
				CRASH_VAL.store(0);
			}
			for (u32 j = 0; j < crash_iterators.size(); j++){
				curr_output_left = curr_output_left + audiobuffers[4][crash_iterators[j]] * SOUND_EFFECT_VOLUME;
				curr_output_right = curr_output_right + audiobuffers[5][crash_iterators[j]] * SOUND_EFFECT_VOLUME;
				crash_iterators[j] = crash_iterators[j] + 1;
				if (crash_iterators[j] == gameover_size - 1){
					crash_iterators.erase(crash_iterators.begin()+j);
					j--;
				}
			}

			if (CONSUME_VAL.load() == 1){

				consume_iterators.push_back(0);
				CONSUME_VAL.store(0);
			}
			for (u32 j = 0; j < consume_iterators.size(); j++){
				curr_output_left = curr_output_left + audiobuffers[6][consume_iterators[j]] * SOUND_EFFECT_VOLUME;
				curr_output_right = curr_output_right + audiobuffers[7][consume_iterators[j]] * SOUND_EFFECT_VOLUME;
				consume_iterators[j] = consume_iterators[j] + 1;
				if (consume_iterators[j] == consume_apple_size - 1){
					consume_iterators.erase(consume_iterators.begin()+j);
					j--;
				}
			}

			// Write audio output to codec
			Xil_Out32(I2S_DATA_TX_L_REG, curr_output_left);
			Xil_Out32(I2S_DATA_TX_R_REG, curr_output_right);

			usleep(21);

//			if (MENU_VAL.load() == 0 && CRASH_VAL.load() == 0 && CONSUME_VAL.load() == 0){
//				// Write audio output to codec
//				VOLUME = VOL_VAL.load();
//				Xil_Out32(I2S_DATA_TX_L_REG, audiobuffers[0][i] * VOLUME);
//				Xil_Out32(I2S_DATA_TX_R_REG, audiobuffers[1][i] * VOLUME);
//			}
//
//
//			if (MENU_VAL.load() == 1 /*&& menu_iter < menu_buttons_size*/){
//
//				Xil_Out32(I2S_DATA_TX_L_REG, audiobuffers[2][menu_iter] * SOUND_EFFECT_VOLUME);
//				Xil_Out32(I2S_DATA_TX_R_REG, audiobuffers[3][menu_iter] * SOUND_EFFECT_VOLUME);
//
//				if (menu_iter == menu_buttons_size - 1){
//					menu_iter = 0;
//					MENU_VAL.store(0);
//				}
//				else{
//					menu_iter++;
//				}
//			}
//
//			if (CRASH_VAL.load() == 1){
//
//				Xil_Out32(I2S_DATA_TX_L_REG, audiobuffers[4][crash_iter] * SOUND_EFFECT_VOLUME);
//				Xil_Out32(I2S_DATA_TX_R_REG, audiobuffers[5][crash_iter] * SOUND_EFFECT_VOLUME);
//
//				if (crash_iter == gameover_size - 1){
//					crash_iter = 0;
//					CRASH_VAL.store(0);
//				}
//				else{
//					crash_iter++;
//				}
//			}
//
//			if (CONSUME_VAL.load() == 1){
//
//				Xil_Out32(I2S_DATA_TX_L_REG, audiobuffers[6][consume_iter] * SOUND_EFFECT_VOLUME);
//				Xil_Out32(I2S_DATA_TX_R_REG, audiobuffers[7][consume_iter] * SOUND_EFFECT_VOLUME);
//
//				if (consume_iter == consume_apple_size - 1){
//					consume_iter = 0;
//					CONSUME_VAL.store(0);
//				}
//				else{
//					consume_iter++;
//				}
//			}
//
//
//			usleep(21);
		}
	}
	return;

}

unsigned char IicConfig(unsigned int DeviceIdPS) {
	XIicPs_Config *Config;
	int Status;

	/* Initialise the IIC driver so that it's ready to use */

	// Look up the configuration in the config table
	Config = XIicPs_LookupConfig(DeviceIdPS);
	if(NULL == Config) {
		return XST_FAILURE;
	}

	// Initialise the IIC driver configuration
	Status = XIicPs_CfgInitialize(&Iic, Config, Config->BaseAddress);
	if(Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	//Set the IIC serial clock rate.
	XIicPs_SetSClk(&Iic, IIC_SCLK_RATE);

	return XST_SUCCESS;
}


void AudioPllConfig() {

	unsigned char u8TxData[8], u8RxData[6];
	int Status;

	Status = IicConfig(XPAR_XIICPS_0_DEVICE_ID);
	if(Status != XST_SUCCESS) {
		xil_printf("\nError initializing IIC");

	}

	// Disable Core Clock
	AudioWriteToReg(R0_CLOCK_CONTROL, 0x0E);

	/* 	MCLK = 10 MHz
		R = 0100 = 4, N = 0x02 0x3C = 572, M = 0x02 0x71 = 625

		PLL required output = 1024x48 KHz
		(PLLout)			= 49.152 MHz

		PLLout/MCLK			= 49.152 MHz/10 MHz
							= 4.9152 MHz
							= R + (N/M)
							= 4 + (572/625) */

	// Write 6 bytes to R1 @ register address 0x4002
	u8TxData[0] = 0x40; // Register write address [15:8]
	u8TxData[1] = 0x02; // Register write address [7:0]
	u8TxData[2] = 0x02; // byte 6 - M[15:8]
	u8TxData[3] = 0x71; // byte 5 - M[7:0]
	u8TxData[4] = 0x02; // byte 4 - N[15:8]
	u8TxData[5] = 0x3C; // byte 3 - N[7:0]
	u8TxData[6] = 0x21; // byte 2 - 7 = reserved, bits 6:3 = R[3:0], 2:1 = X[1:0], 0 = PLL operation mode
	u8TxData[7] = 0x01; // byte 1 - 7:2 = reserved, 1 = PLL Lock, 0 = Core clock enable

	// Write bytes to PLL Control register R1 @ 0x4002
	XIicPs_MasterSendPolled(&Iic, u8TxData, 8, (IIC_SLAVE_ADDR >> 1));
	while(XIicPs_BusIsBusy(&Iic));

	// Register address set: 0x4002
	u8TxData[0] = 0x40;
	u8TxData[1] = 0x02;

	// Poll PLL Lock bit
	do {
		XIicPs_MasterSendPolled(&Iic, u8TxData, 2, (IIC_SLAVE_ADDR >> 1));
		while(XIicPs_BusIsBusy(&Iic));
		XIicPs_MasterRecvPolled(&Iic, u8RxData, 6, (IIC_SLAVE_ADDR >> 1));
		while(XIicPs_BusIsBusy(&Iic));
	}
	while((u8RxData[5] & 0x02) == 0); // while not locked

	AudioWriteToReg(R0_CLOCK_CONTROL, 0x0F);	// 1111
												// bit 3:		CLKSRC = PLL Clock input
												// bits 2:1:	INFREQ = 1024 x fs
												// bit 0:		COREN = Core Clock enabled
}



void AudioWriteToReg(unsigned char u8RegAddr, unsigned char u8Data) {

	unsigned char u8TxData[3];

	u8TxData[0] = 0x40;
	u8TxData[1] = u8RegAddr;
	u8TxData[2] = u8Data;

	XIicPs_MasterSendPolled(&Iic, u8TxData, 3, (IIC_SLAVE_ADDR >> 1));
	while(XIicPs_BusIsBusy(&Iic));
}


void AudioConfigureJacks() {
	AudioWriteToReg(R4_RECORD_MIXER_LEFT_CONTROL_0, 0x01); //enable mixer 1
	AudioWriteToReg(R5_RECORD_MIXER_LEFT_CONTROL_1, 0x07); //unmute Left channel of line in into mxr 1 and set gain to 6 db
	AudioWriteToReg(R6_RECORD_MIXER_RIGHT_CONTROL_0, 0x01); //enable mixer 2
	AudioWriteToReg(R7_RECORD_MIXER_RIGHT_CONTROL_1, 0x07); //unmute Right channel of line in into mxr 2 and set gain to 6 db
	AudioWriteToReg(R19_ADC_CONTROL, 0x13); //enable ADCs

	AudioWriteToReg(R22_PLAYBACK_MIXER_LEFT_CONTROL_0, 0x21); //unmute Left DAC into Mxr 3; enable mxr 3
	AudioWriteToReg(R24_PLAYBACK_MIXER_RIGHT_CONTROL_0, 0x41); //unmute Right DAC into Mxr4; enable mxr 4
	AudioWriteToReg(R26_PLAYBACK_LR_MIXER_LEFT_LINE_OUTPUT_CONTROL, 0x05); //unmute Mxr3 into Mxr5 and set gain to 6db; enable mxr 5
	AudioWriteToReg(R27_PLAYBACK_LR_MIXER_RIGHT_LINE_OUTPUT_CONTROL, 0x11); //unmute Mxr4 into Mxr6 and set gain to 6db; enable mxr 6
	AudioWriteToReg(R29_PLAYBACK_HEADPHONE_LEFT_VOLUME_CONTROL, 0xFF);//Mute Left channel of HP port (LHP)
	AudioWriteToReg(R30_PLAYBACK_HEADPHONE_RIGHT_VOLUME_CONTROL, 0xFF); //Mute Right channel of HP port (LHP)
	//AudioWriteToReg(R31_PLAYBACK_LINE_OUTPUT_LEFT_VOLUME_CONTROL, 0xE6); //set LOUT volume (0db); unmute left channel of Line out port; set Line out port to line out mode
	//AudioWriteToReg(R32_PLAYBACK_LINE_OUTPUT_RIGHT_VOLUME_CONTROL, 0xE6); // set ROUT volume (0db); unmute right channel of Line out port; set Line out port to line out mode
	AudioWriteToReg(R31_PLAYBACK_LINE_OUTPUT_LEFT_VOLUME_CONTROL, 0xFE); //set LOUT volume (0db); unmute left channel of Line out port; set Line out port to line out mode
	AudioWriteToReg(R32_PLAYBACK_LINE_OUTPUT_RIGHT_VOLUME_CONTROL, 0xFE); // set ROUT volume (0db); unmute right channel of Line out port; set Line out port to line out mode
	AudioWriteToReg(R35_PLAYBACK_POWER_MANAGEMENT, 0x03); //enable left and right channel playback (not sure exactly what this does...)
	AudioWriteToReg(R36_DAC_CONTROL_0, 0x03); //enable both DACs

	AudioWriteToReg(R58_SERIAL_INPUT_ROUTE_CONTROL, 0x01); //Connect I2S serial port output (SDATA_O) to DACs
	AudioWriteToReg(R59_SERIAL_OUTPUT_ROUTE_CONTROL, 0x01); //connect I2S serial port input (SDATA_I) to ADCs

	AudioWriteToReg(R65_CLOCK_ENABLE_0, 0x7F); //Enable clocks
	AudioWriteToReg(R66_CLOCK_ENABLE_1, 0x03); //Enable rest of clocks
}


void LineinLineoutConfig() {

	AudioWriteToReg(R17_CONVERTER_CONTROL_0, 0x05);//48 KHz
	AudioWriteToReg(R64_SERIAL_PORT_SAMPLING_RATE, 0x05);//48 KHz
	AudioWriteToReg(R19_ADC_CONTROL, 0x13);
	AudioWriteToReg(R36_DAC_CONTROL_0, 0x03);
	AudioWriteToReg(R35_PLAYBACK_POWER_MANAGEMENT, 0x03);
	AudioWriteToReg(R58_SERIAL_INPUT_ROUTE_CONTROL, 0x01);
	AudioWriteToReg(R59_SERIAL_OUTPUT_ROUTE_CONTROL, 0x01);
	AudioWriteToReg(R65_CLOCK_ENABLE_0, 0x7F);
	AudioWriteToReg(R66_CLOCK_ENABLE_1, 0x03);

	AudioWriteToReg(R4_RECORD_MIXER_LEFT_CONTROL_0, 0x01);
	AudioWriteToReg(R5_RECORD_MIXER_LEFT_CONTROL_1, 0x05);//0 dB gain
	AudioWriteToReg(R6_RECORD_MIXER_RIGHT_CONTROL_0, 0x01);
	AudioWriteToReg(R7_RECORD_MIXER_RIGHT_CONTROL_1, 0x05);//0 dB gain

	AudioWriteToReg(R22_PLAYBACK_MIXER_LEFT_CONTROL_0, 0x21);
	AudioWriteToReg(R24_PLAYBACK_MIXER_RIGHT_CONTROL_0, 0x41);
	AudioWriteToReg(R26_PLAYBACK_LR_MIXER_LEFT_LINE_OUTPUT_CONTROL, 0x03);//0 dB
	AudioWriteToReg(R27_PLAYBACK_LR_MIXER_RIGHT_LINE_OUTPUT_CONTROL, 0x09);//0 dB
	AudioWriteToReg(R29_PLAYBACK_HEADPHONE_LEFT_VOLUME_CONTROL, 0xE7);//0 dB
	AudioWriteToReg(R30_PLAYBACK_HEADPHONE_RIGHT_VOLUME_CONTROL, 0xE7);//0 dB
	AudioWriteToReg(R31_PLAYBACK_LINE_OUTPUT_LEFT_VOLUME_CONTROL, 0xE6);//0 dB
	AudioWriteToReg(R32_PLAYBACK_LINE_OUTPUT_RIGHT_VOLUME_CONTROL, 0xE6);//0 dB
}
