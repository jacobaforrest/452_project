#include "core.h"
#include <atomic>
#include "collision.h"

/* ---------------------------------------------------------------------------- *
 * 								 Definitions									*
 * ---------------------------------------------------------------------------- */

#define main_menu snake::main_menu
#define volume_menu snake::volume_menu
#define highscore_menu snake::highscore_menu
#define gameplay snake::gameplay
#define gameover snake::gameover
#define pre_gameover snake::pre_gameover

#define up snake::North
#define left snake::West
#define right snake::East
#define down snake::South

enum state currentState = main_menu;

const char* options[] =
{
	"Adjust Volume", // Main Menu
	"View Highscores", // Main Menu
	"Play Game", // Main Menu
	"Increase Volume", // Volume Menu
	"Decrease Volume", // Volume Menu
	"Return" // Volume Menu, Highscore Menu, Gameover Menu
};

u64 timeout_us = 200000;
u64 gameoverTimeoutUs = 20000;
u64 mini_timeout_us = 2000;
int tempMovementCounter = 0;
Xuint32 *RNG_BASEADDR_p = (Xuint32 *)(XPAR_RNG_0_S00_AXI_BASEADDR); //output stored in register 0

unsigned int volume = 5;

//#define VOL_VAL (*(volatile unsigned int *)(0xFFFF0000))
//#define MENU_VAL (*(volatile unsigned int *)(0xFFFF0004))

#define VOL_VAL (*(/*volatile*/ std::atomic<unsigned int> *)(0xFFFF0000))
#define MENU_VAL (*(/*volatile*/ std::atomic<unsigned int> *)(0xFFFF0004))
#define CRASH_VAL (*(/*volatile*/ std::atomic<unsigned int> *)(0xFFFF0008))
#define CONSUME_VAL (*(/*volatile*/ std::atomic<unsigned int> *)(0xFFFF000C))


//int volume = 5;

//define VOL_VAL (*(volatile unsigned long *)(0xFFFF0000))


//#define sev() __asm__("sev")
//#define ARM1_STARTADR 0xFFFFFFF0
//#define ARM1_BASEADDR 0x10080000
//#define COMM_VAL (*(volatile unsigned long *)(0xFFFF0000))

/* ---------------------------------------------------------------------------- *
 * 									main()										*
 * ---------------------------------------------------------------------------- *
 *
 * ---------------------------------------------------------------------------- */
int main(void)
{
	VOL_VAL.store(volume);
	MENU_VAL.store(0);
	CRASH_VAL.store(0);
	CONSUME_VAL.store(0);
	xil_printf("----------------------------------------\r\n");
	xil_printf("Entering Main\r\n");

	snake::Init();
	/* Display interactive menu interface via terminal */
	finiteStateMachine();

	snake::DeInit();

	return 1;
} // main()


/* ---------------------------------------------------------------------------- *
 * 									finiteStateMachine()						*
 * ---------------------------------------------------------------------------- *
 *
 * ---------------------------------------------------------------------------- */
void finiteStateMachine(){
	u8 input = 0x00;
	u32 location = 0x00000000;
	u32 location2 = 0x00000000;
	int cursor_position = 0;


	u32 CntrlRegister;

	CntrlRegister = XUartPs_ReadReg(UART_BASEADDR, XUARTPS_CR_OFFSET);
	XUartPs_WriteReg(UART_BASEADDR, XUARTPS_CR_OFFSET,
					  ((CntrlRegister & ~XUARTPS_CR_EN_DIS_MASK) |
					   XUARTPS_CR_TX_EN | XUARTPS_CR_RX_EN));

	while(1){
		switch(currentState)
		{
			case main_menu:
			{
				cursor_position = 0;

				while (currentState == main_menu)
				{
					snake::Render(currentState, true, true, false, cursor_position);
					draw_main_menu(cursor_position);
					xil_printf("Press 's' to select the currently highlighted option\r\n");
					xil_printf("Press 'w' to move the cursor up\r\n");
					xil_printf("Press 'x' to move the cursor down\r\n");
					xil_printf("Press 'r' to read a random number\r\n");
					// Wait for input from UART via the terminal
					input = read_input();
					switch(input)
					{
						case 's':
						{
							select_option(cursor_position); // Can change currentState
							break;
						}
						case 'w':
						{
							move_cursor_up(&cursor_position);
							break;
						}
						case 'x':
						{
							move_cursor_down(&cursor_position);
							break;
						}
						case 'r':
						{
							RNG_get();
							break;
						}
					}
				}
				break;
			}
			case volume_menu:
			{
				cursor_position = 3;

				while (currentState == volume_menu)
				{
					snake::Render(currentState, true, true, false, cursor_position, volume);
					draw_volume_menu(cursor_position);
					xil_printf("Press 's' to select the currently highlighted option\r\n");
					xil_printf("Press 'w' to move the cursor up\r\n");
					xil_printf("Press 'x' to move the cursor down\r\n");
					// Wait for input from UART via the terminal
					input = read_input();
					switch(input)
					{
						case 's':
						{
							select_option(cursor_position); // Can change currentState
							break;
						}
						case 'w':
						{
							move_cursor_up(&cursor_position);
							break;
						}
						case 'x':
						{
							move_cursor_down(&cursor_position);
							break;
						}
					}
				}

				break;
			}
			case highscore_menu:
			{
				cursor_position = 5;

				while (currentState == highscore_menu)
				{
					snake::Render(currentState, true, true, false, cursor_position);
					draw_highscore_menu(cursor_position);
					xil_printf("Press 's' to select the currently highlighted option\r\n");
					xil_printf("Press 'w' to move the cursor up\r\n");
					xil_printf("Press 'x' to move the cursor down\r\n");
					// Wait for input from UART via the terminal
					input = read_input();
					switch(input)
					{
						case 's':
						{
							select_option(cursor_position); // Can change currentState
							break;
						}
						case 'w':
						{
							move_cursor_up(&cursor_position);
							break;
						}
						case 'x':
						{
							move_cursor_down(&cursor_position);
							break;
						}
					}
				}

				break;
			}
			case gameplay:
			{
				snake::SetHardMode(false);

				enum direction currentDirection = right;
				enum direction newDirection = right;
				draw_grid();
				initialize_snake();
				location = RNG_get();
				spawn_apple(location);
				xil_printf("Press 'w' to set direction = 'up'\r\n");
				xil_printf("Press 'a' to set direction = 'left'\r\n");
				xil_printf("Press 'd' to set direction = 'right'\r\n");
				xil_printf("Press 's' to set direction = 'down'\r\n");
				xil_printf("Press 'p' to pause the game\r\n");
				while (currentState == gameplay)
				{
					u32 new_pos;

					XTime tPausedStart, tPausedEnd;
					u64 tPauseElapsed;

					XTime tStart, tEnd;
					u64 tElapsed;
					s64 deltaTimeElapsed;

					XTime_GetTime(&tStart);
					tElapsed = 0;

					u64 realTimeOut = snake::GetTimeOut(timeout_us);

					while(tElapsed < timeout_us){
						input = read_input_timeout();
						XTime_GetTime(&tEnd);
						deltaTimeElapsed = -tElapsed;
						tElapsed = (tEnd-tStart) / (COUNTS_PER_SECOND/1000000);
						deltaTimeElapsed += tElapsed;

						switch(input)
						{
							case 'w':
							{
								if (currentDirection != down && currentDirection != up){
									change_direction(&newDirection, up);
								}
								break;
							}
							case 'a':
							{
								if (currentDirection != right && currentDirection != left){
									change_direction(&newDirection, left);
								}
								break;
							}
							case 'd':
							{
								if (currentDirection != left && currentDirection != right){
									change_direction(&newDirection, right);
								}
								break;
							}
							case 's':
							{
								if (currentDirection != up && currentDirection != down){
									change_direction(&newDirection, down);
								}
								break;
							}
							case 'p':
							{
								XTime_GetTime(&tPausedStart);
								pause_game();
								while (input != 'r'){
									input = read_input();
								}
								XTime_GetTime(&tPausedEnd);
								tPauseElapsed = (tPausedEnd-tPausedStart);
								tStart = tStart + tPauseElapsed;

								resume_game();
							}
							default:
							{
								break;
							}
						}

						if(snake::UpdateTime((u32) deltaTimeElapsed))
						{
							// nothing for now. will call to update timer later.
						}
					}
					clear_inputs();

					currentDirection = newDirection;
					move_snake(currentDirection);

					snake::collision::CollisionFlag collision = snake::collision::DetectCollision();

					if (collision & snake::collision::apple == snake::collision::apple)
					{
						xil_printf("Apple Collision\r\n");
						play_apple_sound_effect();
						consume_apple();
						update_score();
						extend_snake();
						new_pos = RNG_get();
						spawn_apple(new_pos);
						snake::Render(currentState);
					}
					else if (collision == snake::collision::wall || collision == snake::collision::snake)
					{
						xil_printf("Crash Detected\r\n");
						play_crash_sound_effect();
						snake::ResetSnakeComponents();
						xil_printf("Storing Score to Memory\r\n");
						currentState = pre_gameover;
						snake::Render(currentState, false);
						snake::UpdateHighScores(snake::GetScore());
					}
					else
					{
						// very stupid change to fix a dumb bug.
						snake::Render(currentState);
					}
				}
			}
			case pre_gameover:
			{
				for(int i = 0; i < 10; ++i)
				{
					XTime tStart, tEnd;
					u64 tElapsed;

					XTime_GetTime(&tStart);
					tElapsed = 0;

					while(tElapsed < gameoverTimeoutUs){
						input = read_input_timeout();
						XTime_GetTime(&tEnd);
						tElapsed = (tEnd-tStart) / (COUNTS_PER_SECOND/1000000);
					}

					xil_printf("pre game over loop\r\n");
					snake::Render(gameplay, false, (i & 1) == 0);
				}

				snake::ResetSnakeComponents();
				currentState = gameover;
			}
			case gameover:
			{
				// render game over screen
				snake::Render(currentState);

				cursor_position = 5;

				while (currentState == gameover)
				{
					draw_gameover_menu(cursor_position);
					xil_printf("Press 's' to select the currently highlighted option\r\n");
					xil_printf("Press 'w' to move the cursor up\r\n");
					xil_printf("Press 'x' to move the cursor down\r\n");
					// Wait for input from UART via the terminal
					input = read_input();
					switch(input)
					{
						case 's':
						{
							select_option(cursor_position); // Can change currentState
							break;
						}
						case 'w':
						{
							move_cursor_up(&cursor_position);
							break;
						}
						case 'x':
						{
							move_cursor_down(&cursor_position);
							break;
						}
						default:
						{
							break;
						}
					}
				}

				break;
			}
			default:
			{
				break;
			}

		}
	}
} // menu()


u32 RNG_get(){
	xil_printf("Reading output from pseudo random number generator\r\n");
	int random_num = *(RNG_BASEADDR_p+0); // Read from register 0
	xil_printf("Random Number:   %u\r\n", random_num);
	return random_num;

	/*
	// to do: integrate with Jake's RNG stuff
	static u32 index = 0;
	const u32 randomTable[] =
	{
			0xADDBD3A9, 0x7E822EE0, 0xCE348E0F, 0x858AD815, 0x2C633237, 0x5F563EA6, 0xAA952ED7, 0x280A27AB, 0xD30A52B1, 0x6C423C8D, 0x88057FB8, 0xA340E748, 0x9A27D857, 0x5753F137, 0xA5CA44DE, 0xD788AB40,
			0x65407C34, 0xC76FEF09, 0x93A40570, 0x18C34C8A, 0x64147FF4, 0x32B7E33C, 0x8A043128, 0xDB038AE8, 0xFB8FD41C, 0x181F69F9, 0x533CBF56, 0xF52B6E17, 0x63036FE0, 0x9B7DDC09, 0xADD40AC0, 0xD53A0962,
			0x5E105405, 0xB70CAB83, 0x2ED401C8, 0xD1722F02, 0xD4D54D86, 0x7D5C2B47, 0xB2B70B1A, 0xA50F49E7, 0xBAF195B9, 0x9938D8DF, 0x1B0A83F6, 0x3D9EF9EE, 0xEA7E66F5, 0x31163792, 0xA2C2EAF9, 0x41A61DEB,
			0xFCEC6378, 0xE75A3B0C, 0x3D6C2F2B, 0xD14AC427, 0xCDA949EC, 0x56E90A54, 0xAAA192C6, 0x60536026, 0x580852C7, 0x788E7DF8, 0x9C67C962, 0xAD1659EF, 0x004B6F89, 0xBD098A98, 0xF1F6EE40, 0x9D0BC34A,
			0x09A9411D, 0xE4137F4B, 0xE2F27230, 0xB8F1CD16, 0x0F7B0A09, 0xF39E0DDC, 0x2D9A16AA, 0x30E06013, 0x9585915D, 0xB229BBF4, 0xC75F956E, 0x4A0022C2, 0x7663116F, 0x3E2B642B, 0x357CC253, 0x950E4800,
			0xE29A5EDE, 0x558BB5B7, 0x07573074, 0x265D94E7, 0x6635C1DC, 0xEB9AE16C, 0x20C58D3D, 0x6DA1FCF7, 0x1B96C00C, 0xB32BD9A2, 0x6C676916, 0xABFB9EB3, 0x6CA22380, 0xEADC5259, 0xB5937C55, 0x8A6DE4A9,
			0xE9CD2A60, 0xB2E101C2, 0x7D6A2D6A, 0xA8DBE3CD, 0x86E1559D, 0x0D7C3D5F, 0xFFC3BB95, 0x7B65CC3C, 0xE803CF9B, 0xA376C074, 0x174031E3, 0xB1F4BA50, 0x75FE9D6E, 0x44E1385C, 0x3C799B6B, 0xDEB4749B,
			0xCBD2B4D2, 0x32A3AA31, 0x2AFD45FF, 0x84C2A35E, 0x6AB35EB4, 0xBCE444A5, 0x2BCE9718, 0x1EE06717, 0xE130FC8A, 0x089A42D1, 0x443779C2, 0x1167F95D, 0xC529301F, 0xC3F7CF20, 0x1E90C0A4, 0x43C88EEC,
			0x19453539, 0x07D1880E, 0xFA8AD0A7, 0xF914DC44, 0xA827F846, 0x44E502BF, 0x08588702, 0x96E9F667, 0xD158C18A, 0x119D46CA, 0x27560BF1, 0x4139ED7E, 0x528D832A, 0x304C26BD, 0x9B784564, 0x516D4D78,
			0x4309FD6B, 0xBE7BA696, 0xB6732518, 0xA6244E74, 0xA0C2DCB0, 0x6C3EF472, 0x8FAACA24, 0x39E76F90, 0x42BF11F5, 0x51D149CB, 0x47EFF6A9, 0x395AAFFE, 0xC8E4ACA7, 0x49997AF3, 0x733C395F, 0x1E84D81B,
			0x55D9F224, 0x80017868, 0x801EE88A, 0xCCE276EF, 0x4ABF77FB, 0x8C414473, 0xE1C200C2, 0x62766621, 0x9827BB33, 0x87E6B8B4, 0x70A96B70, 0xAAF715EA, 0x78AADCC8, 0x17533643, 0x756F08B1, 0xF098AA07,
			0xAE02A6A9, 0x7ADC2D6D, 0x78993F6A, 0x742C162E, 0x6E80B0EC, 0xF1573604, 0xAB4F12A0, 0x953E9878, 0x05C362A2, 0xA789C100, 0x86F2D3A4, 0xD82A1599, 0x0927BF1A, 0x9382753E, 0xA9753615, 0xA542E33F,
			0x22F5257B, 0xE79BE068, 0x0F432E9F, 0x6EB135A8, 0x03F6F6DB, 0x6AF14712, 0x30C03C0F, 0x40765DB5, 0x6CDDCB79, 0x6859BB51, 0x7519C363, 0x582EB047, 0x2D061B10, 0xAEF0E4BD, 0xC5316E76, 0x7ABE1A17,
			0xB8A25D87, 0x9C20387E, 0xAE95B5F1, 0xD347C3D0, 0xFBEB99A9, 0xFBA95391, 0x5E715094, 0x4A5A51C3, 0x500E5850, 0xD1EA4A17, 0xE0185A63, 0xC7D022CE, 0xB8C5226D, 0x8BED86BF, 0x59A7E342, 0xA3AA46BF,
			0x1B54BED0, 0x9E1F626F, 0x0ADCC45C, 0x155E471D, 0x2ACB8C86, 0x4D2C26CA, 0x75F22291, 0x9DF9AB0F, 0x29571070, 0xB7E65F28, 0x849F101F, 0xACE28FF0, 0x793660C7, 0x6CFC90BD, 0xA9797606, 0x8B7283D8,
			0xA75CA440, 0xDC046933, 0x124A3FFE, 0x22177EC3, 0x1B30FE90, 0xB37B3544, 0xFB4C9FEF, 0x43E97320, 0x2DC39EEE, 0xF7F9670A, 0xF1914098, 0x01B81848, 0x2718BC92, 0xA4FA33BE, 0x6A895E8E, 0xA5B63486,
	};


	return randomTable[ (index++) % 256 ];
	*/
}
void draw_main_menu(int currentIndex){
	char* arrow0 = "";
	char* arrow1 = "";
	char* arrow2 = "";

	switch(currentIndex){
	case 0: arrow0  = "<-"; break;
	case 1: arrow1 = "<-"; break;
	case 2: arrow2  = "<-"; break;
	}


	xil_printf("Main Menu\r\n");
	xil_printf("----------------------------------------\r\n");
	xil_printf("Options:\r\n");
	xil_printf("	Adjust Volume   %s\r\n", arrow0);
	xil_printf("	View Highscores %s\r\n", arrow1);
	xil_printf("	Play Game       %s\r\n", arrow2);
	xil_printf("\r\n");

}
void draw_volume_menu(int currentIndex){
	char* arrow3 = "";
	char* arrow4 = "";
	char* arrow5 = "";

	switch(currentIndex){
	case 3: arrow3  = "<-"; break;
	case 4: arrow4 = "<-"; break;
	case 5: arrow5  = "<-"; break;
	}

	xil_printf("Volume Menu\r\n");
	xil_printf("----------------------------------------\r\n");
	xil_printf("Options:\r\n");
	xil_printf("	Increase Volume   %s\r\n", arrow3);
	xil_printf("	Decrease Volume   %s\r\n", arrow4);
	xil_printf("	Return            %s\r\n", arrow5);
	xil_printf("\r\n");

}
void draw_highscore_menu(int currentIndex){
	char* arrow5 = "";

	switch(currentIndex){
	case 5: arrow5  = "<-"; break;
	}

	u32 highScores[5];
	snake::GetHighScores(highScores);

	xil_printf("Highscore Menu\r\n");
	xil_printf("----------------------------------------\r\n");
	xil_printf("%i\r\n", highScores[0]);
	xil_printf("%i\r\n", highScores[1]);
	xil_printf("%i\r\n", highScores[2]);
	xil_printf("%i\r\n", highScores[3]);
	xil_printf("%i\r\n", highScores[4]);
	xil_printf("----------------------------------------\r\n");
	xil_printf("Options:\r\n");
	xil_printf("	Return   %s\r\n", arrow5);
	xil_printf("\r\n");

}
void get_highscores(){
	xil_printf("Reading high scores from memory\r\n");
}
void draw_grid(){
	xil_printf("Drawing game board\r\n");
}
void initialize_snake(){
	xil_printf("Drawing initial snake\r\n");
	snake::InitSnakeComponents();
	snake::ResetScore();
	snake::ResetTime();
}
void select_option(int currentIndex){
	xil_printf("Selecting the highlighted option\r\n");
	MENU_VAL.store(1); //= 1;

	switch(currentIndex)
		{
			case 0:
			{
				currentState = volume_menu;
				break;
			}
			case 1:
			{
				currentState = highscore_menu;
				break;
			}
			case 2:
			{
				currentState = gameplay;
				break;
			}
			case 3:
			{
				increase_volume();
				break;
			}
			case 4:
			{
				decrease_volume();
				break;
			}
			case 5:
			{
				currentState = main_menu;
				break;
			}
			default:
			{
				break;
			}
		}

	return;
}
void move_cursor_up(int* currentIndex){
	xil_printf("Moving cursor up\r\n");
	switch(currentState)
	{
		case main_menu:
		{
			*currentIndex == 0 ? *currentIndex = *currentIndex : *currentIndex = *currentIndex - 1;
			break;
		}
		case volume_menu:
		{
			*currentIndex == 3 ? *currentIndex = *currentIndex : *currentIndex = *currentIndex - 1;
			break;
		}
		case highscore_menu:
		{
			//
			break;
		}
		case gameover:
		{
			//
			break;
		}
		default:
		{
			break;
		}
	}
	//xil_printf("> Cursor is highlighting %s\r\n", options[*currentIndex]);
	return;
}
void move_cursor_down(int* currentIndex){
	xil_printf("Moving cursor down\r\n");
	switch(currentState)
	{
		case main_menu:
		{
			*currentIndex == 2 ? *currentIndex = *currentIndex : *currentIndex = *currentIndex + 1;
			break;
		}
		case volume_menu:
		{
			*currentIndex == 5 ? *currentIndex = *currentIndex : *currentIndex = *currentIndex + 1;
			break;
		}
		case highscore_menu:
		{
			//
			break;
		}
		case gameover:
		{
			//
			break;
		}
		default:
		{
			break;
		}
	}
	//xil_printf("> Cursor is highlighting %s\r\n", options[*currentIndex]);
	return;
}
void increase_volume(){
	xil_printf("Increasing audio volume\r\n");
	volume = (volume < 10) ? volume + 1 : volume;
	VOL_VAL.store(volume);// = volume;

}
void decrease_volume(){
	xil_printf("Decreasing audio volume\r\n");
	volume = (volume > 0) ? volume - 1 : volume;
	VOL_VAL.store(volume);// = volume;
}
void start_game(){
	xil_printf("Starting gameplay\r\n");
}
void draw_gameover_menu(int currentIndex){
	char* arrow5 = "";

	switch(currentIndex){
	case 5: arrow5  = "<-"; break;
	}


	xil_printf("Gameover Menu\r\n");
	xil_printf("----------------------------------------\r\n");
	xil_printf("Score: 1\r\n");
	xil_printf("----------------------------------------\r\n");
	xil_printf("Options:\r\n");
	xil_printf("	Return   %s\r\n", arrow5);
	xil_printf("\r\n");
}
void menu_return(){
	xil_printf("Returning to main menu\r\n");
}
void play_apple_sound_effect(){
	xil_printf("Triggering apple sound effect\r\n");
	CONSUME_VAL.store(1);

}
void play_crash_sound_effect(){
	xil_printf("Triggering crash sound effect\r\n");
	CRASH_VAL.store(1);
}
void change_direction(direction* newDirection, direction dir){
	xil_printf("Snake direction = %s\r\n", getEnum(dir));
	*newDirection = dir;
}

void extend_snake(){
	xil_printf("Extending snake\r\n");
	snake::ExtendSnake();
}
void spawn_apple(u32 location){
	xil_printf("Drawing apple\r\n");
	u32 xPos = location & 0x0000000F;
	u32 yPos = location & 0x000F0000;

	yPos = yPos >> 16;

	if(xPos >= GRID_SIZE)
	{
		xPos = GRID_SIZE - 1;
	}
	if(yPos >= GRID_SIZE)
	{
		yPos = GRID_SIZE - 1;
	}

	snake::SetApplePosition(xPos, yPos);
}
void consume_apple(){
	xil_printf("Apple removed from the grid\r\n");
}
void pause_game(){
	xil_printf("Gameplay paused\r\n");
	xil_printf("Press 'r' to resume gameplay\r\n");
}
void resume_game(){
	xil_printf("Gameplay resumed\r\n");
}
void update_score(){
	xil_printf("Drawing current score\r\n");
	snake::UpdateScore();
}

u8 read_input(){
	while (!XUartPs_IsReceiveData(UART_BASEADDR));
	return XUartPs_ReadReg(UART_BASEADDR, XUARTPS_FIFO_OFFSET);
}

void clear_inputs(){
	while (XUartPs_IsReceiveData(UART_BASEADDR)){
		XUartPs_ReadReg(UART_BASEADDR, XUARTPS_FIFO_OFFSET);
	}
}


u8 read_input_timeout(){
	u8 value = 0;
	int result = Xil_poll_timeout(XUartPs_IsReceiveData, UART_BASEADDR, value, value != 0, mini_timeout_us);
	if (result == 0) {
		return XUartPs_ReadReg(UART_BASEADDR, XUARTPS_FIFO_OFFSET);
	} else {
		return 0;
	}
}

const char* getEnum(direction e){
   switch (e)
   {
      case up: return "up";
      case down: return "down";
      case right: return "right";
      case left: return "left";
      default: return "";
   }
}


