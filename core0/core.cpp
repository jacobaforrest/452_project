#include "core.h"
#include <atomic>
#include "collision.h"
#include "render.h"

/* ---------------------------------------------------------------------------- *
 * 								 Definitions									*
 * ---------------------------------------------------------------------------- */

#define main_menu snake::main_menu
#define volume_menu snake::volume_menu
#define highscore_menu snake::highscore_menu
#define gameplay snake::gameplay
#define gameover snake::gameover
#define options_menu snake::options_menu
#define pre_gameover snake::pre_gameover

#define up snake::North
#define left snake::West
#define right snake::East
#define down snake::South

enum state currentState = main_menu;

const char* options[] =
{
	"Adjust Volume", // Main Menu											0
	"View Highscores", // Main Menu											1
	"Play Game", // Main Menu												2
	"Increase Volume", // Volume Menu										3
	"Decrease Volume", // Volume Menu										4
	"Return", // Volume Menu, Highscore Menu, Gameover Menu, Options Menu	5
	"Options", // Main Menu													6
	"Roaming", // Options Menu												7
	"Hard Mode", // Hard Mode												8
	"Snake Color", // Options Menu											9
	"Food Sprite" // Options Menu											10
};

u64 timeout_us = 400000 / 2;
u64 gameoverTimeoutUs = 20000;
u64 mini_timeout_us = 2000;
int tempMovementCounter = 0;
Xuint32 *RNG_BASEADDR_p = (Xuint32 *)(XPAR_RNG_0_S00_AXI_BASEADDR); //output stored in register 0

bool moving_apple = 0;

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
void finiteStateMachine()
{
	u8 input = 0x00;
	//u32 location = 0x00000000;
	u32 new_pos;
	int cursor_position = 0;
	u8 apple_dir = 2; //0 = right, 1 = left, 2 = up, 3 = down


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
			case options_menu:
			{
				cursor_position = 7;

				while (currentState == options_menu)
				{
					snake::Render(currentState, true, true, false, cursor_position, volume, moving_apple);
					draw_options_menu(cursor_position);
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
				u32 curLoop = 0;

				enum direction currentDirection = right;
				enum direction newDirection = right;
				draw_grid();
				initialize_snake();
				new_pos = RNG_get();
				spawn_apple(new_pos);
				xil_printf("Press 'w' to set direction = 'up'\r\n");
				xil_printf("Press 'a' to set direction = 'left'\r\n");
				xil_printf("Press 'd' to set direction = 'right'\r\n");
				xil_printf("Press 's' to set direction = 'down'\r\n");
				xil_printf("Press 'p' to pause the game\r\n");
				input = 'd';

				while (currentState == gameplay)
				{
					curLoop++;
					XTime tPausedStart, tPausedEnd;
					u64 tPauseElapsed;

					XTime tStart, tEnd;
					u64 tElapsed;
					s64 deltaTimeElapsed;

					XTime_GetTime(&tStart);
					tElapsed = 0;

					u64 realTimeOut = snake::GetTimeOut(timeout_us);

					while(tElapsed < realTimeOut)
					{
						input = read_input_timeout();
						XTime_GetTime(&tEnd);
						deltaTimeElapsed = -tElapsed;
						tElapsed = (tEnd-tStart) / (COUNTS_PER_SECOND/1000000);
						deltaTimeElapsed += tElapsed;

						query_input(input, currentDirection, newDirection, tStart, tEnd, tPausedStart, tPausedEnd, tPauseElapsed);

						if(snake::UpdateTime((u32) deltaTimeElapsed))
						{

						}
					}

					currentDirection = newDirection;
					snake::AltRender(currentDirection);

					tElapsed = 0;
					XTime_GetTime(&tStart);

					clear_inputs();
					while(tElapsed < realTimeOut)
					{
						XTime_GetTime(&tEnd);
						deltaTimeElapsed = -tElapsed;
						tElapsed = (tEnd-tStart) / (COUNTS_PER_SECOND/1000000);
						deltaTimeElapsed += tElapsed;

						query_input(input, currentDirection, newDirection, tStart, tEnd, tPausedStart, tPausedEnd, tPauseElapsed);

						if(snake::UpdateTime((u32) deltaTimeElapsed))
						{
							// nothing for now. will call to update timer later.
						}
					}

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
						curLoop = 0x0;

					}
					else if (collision == snake::collision::wall || collision == snake::collision::snake)
					{
						xil_printf("Crash Detected\r\n");
						play_crash_sound_effect();
						xil_printf("Storing Score to Memory\r\n");
						currentState = pre_gameover;
						snake::Render(currentState, false);
						snake::UpdateHighScores(snake::GetScore());
					}
					else
					{

						if (apple_dir == 0 || apple_dir == 1){
							if (curLoop % 7 == 0){
								if (RNG_get() % 2 == 0){
									apple_dir = 2;
								}
								else{
									apple_dir = 3;
								}
							}
						}
						else{ // (apple_dir == 2 || apple_dir == 3)
							if (curLoop % 7 == 0){
								if (RNG_get() % 2 == 0){
									apple_dir = 0;
								}
								else{
									apple_dir = 1;
								}
							}
						}


						if (moving_apple && curLoop % 2 == 0){
							moveApple(new_pos, apple_dir);
						}

						snake::Render(currentState);
					}
				}
				break;
			}
			case pre_gameover:
			{
				int explosionCount = snake::GetComponentCount() + 4;

				for(int i = 0; i < explosionCount; ++i)
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
					snake::Render(pre_gameover, false, true, false, 0, 5, 0, i);
				}

				snake::ResetSnakeComponents();
				currentState = gameover;
				break;
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
}

void draw_main_menu(int currentIndex){
	char* arrow0 = "";
	char* arrow1 = "";
	char* arrow2 = "";
	char* arrow6 = "";

	switch(currentIndex){
	case 0: arrow0  = "<-"; break;
	case 1: arrow1 = "<-"; break;
	case 2: arrow2  = "<-"; break;
	case 6: arrow6 = "<-"; break;
	}


	xil_printf("Main Menu\r\n");
	xil_printf("----------------------------------------\r\n");
	xil_printf("Options:\r\n");
	xil_printf("	Adjust Volume   %s\r\n", arrow0);
	xil_printf("	View Highscores %s\r\n", arrow1);
	xil_printf("	Options         %s\r\n", arrow6);
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
void draw_options_menu(int currentIndex){
	char* arrow7 = "";
	char* arrow5 = "";
	char* arrow8 = "";
	char* arrow9 = "";
	char* arrow10 = "";

	switch(currentIndex){
	case 7: arrow7 = "<-"; break;
	case 5: arrow5 = "<-"; break;
	case 8: arrow8 = "<-"; break;
	case 9: arrow9 = "<-"; break;
	case 10: arrow10 = "<-"; break;
	}

	xil_printf("Options Menu\r\n");
	xil_printf("----------------------------------------\r\n");
	xil_printf("	Roaming            %s\r\n", arrow7);
	xil_printf("	Hard Mode: %s    %s\r\n",   arrow8); // hard mode
	xil_printf("	Snake Color: %s  %s\r\n", arrow9); // color
	xil_printf("	Food Sprite: %s  %s\r\n", arrow10); // food
	xil_printf("	Return   %s\r\n", arrow5); // return
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


// I like how these stubs just went unused

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
			case 6:
			{
				currentState = options_menu;
				break;
			}
			case 7:
			{
				toggle_roaming();
				break;
			}
			case 8:
			{
				snake::SetHardMode(!snake::GetHardMode());
				break;
			}
			case 9:
			{
				snake::SetSnakeColor((snake::SnakeColor) (((int) snake::GetSnakeColor() + 1) % (int) snake::__SnakeColorCount__));
				break;
			}
			case 10:
			{
				snake::SetFoodSprite((snake::FoodSprite) (((int) snake::GetFoodSprite() + 1) % (int) snake::__FoodSpriteCount__));
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
			if (*currentIndex == 0){
				//
			}
			else if (*currentIndex == 1){
				*currentIndex = 0;
			}
			else if (*currentIndex == 6){
				*currentIndex = 1;
			}
			else if (*currentIndex == 2){
				*currentIndex = 6;
			}

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
		case options_menu:
		{
			if (*currentIndex == 7){
				//
			}
			else if (*currentIndex == 8){
				*currentIndex = 7;
			}
			else if (*currentIndex == 9){
				*currentIndex = 8;
			}
			else if (*currentIndex == 10){
				*currentIndex = 9;
			}
			else if (*currentIndex == 5){
				*currentIndex = 10;
			}

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
			if (*currentIndex == 2){
				//
			}
			else if (*currentIndex == 6){
				*currentIndex = 2;
			}
			else if (*currentIndex == 1){
				*currentIndex = 6;
			}
			else if (*currentIndex == 0){
				*currentIndex = 1;
			}
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
		case options_menu:
		{
			if (*currentIndex == 5){
				//
			}
			else if (*currentIndex == 7){
				*currentIndex = 8;
			}
			else if (*currentIndex == 8){
				*currentIndex = 9;
			}
			else if (*currentIndex == 9){
				*currentIndex = 10;
			}
			else if (*currentIndex == 10){
				*currentIndex = 5;
			}

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

void toggle_roaming(){
	moving_apple = moving_apple ^ 0x1;
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
void spawn_apple(u32 &location){
	xil_printf("Drawing apple\r\n");
	u32 xPos = location & 0x0000000F; // caps at 15
	u32 yPos = location & 0x000F0000; // caps at 15

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

	location = (yPos << 16) | xPos;
}
void consume_apple(){
	xil_printf("Apple removed from the grid\r\n");
}
void pause_game(){
	xil_printf("Gameplay paused\r\n");
	xil_printf("Press 'p' to resume gameplay\r\n");
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

void query_input(u8 input, direction& currentDirection, direction& newDirection, XTime& tStart, XTime& tEnd, XTime& tPausedStart, XTime& tPausedEnd, XTime& tPauseElapsed, bool readInput)
{
	switch(input)
	{
		case 'w':
		{
			if (currentDirection != down && currentDirection != up)
			{
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
			input = '~';
			while (input != 'r')
			{
				snake::render::PaintToCanvas(
					snake::render::GetCanvas(),
					snake::render::GetSprite(snake::sprites::PAUSED),
					600,
					240
				);
				snake::render::Draw();
				snake::render::Draw();
				input = read_input();
			}
			XTime_GetTime(&tPausedEnd);
			tPauseElapsed = (tPausedEnd-tPausedStart);
			tStart = tStart + tPauseElapsed;
		}
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

void moveApple(u32 &pos, u8 &dir){ //0 = east, 1 = west

	u32 xPos = pos & 0x0000000F; // caps at 15
	u32 yPos = pos & 0x000F0000; // caps at 15

	yPos = yPos >> 16;

	if(xPos >= GRID_SIZE)
	{
		xPos = GRID_SIZE - 1;
	}
	if(yPos >= GRID_SIZE)
	{
		yPos = GRID_SIZE - 1;
	}

	snake::MoveApplePosition(xPos, yPos, dir);

	pos = (yPos << 16) | xPos;
}


