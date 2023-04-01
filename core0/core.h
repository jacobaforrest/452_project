
/* ---------------------------------------------------------------------------- *
 * 								Header Files									*
 * ---------------------------------------------------------------------------- */
#include <stdio.h>
#include <xil_io.h>
#include <sleep.h>
// #include "xiicps.h"
#include <xil_printf.h>
#include <xparameters.h>
#include <xbasic_types.h>
//#include "xgpio.h"
#include "xuartps.h"
#include "stdlib.h"
#include "xtime_l.h"
#include "xil_mmu.h"
#include "xscugic.h"

#include "snakeHelper.h"


/* ---------------------------------------------------------------------------- *
 * 							   Type Definitions								    *
 * ---------------------------------------------------------------------------- */

#define state snake::state
#define direction snake::SnakeDirection


/* ---------------------------------------------------------------------------- *
 * 							Prototype Functions									*
 * ---------------------------------------------------------------------------- */
void finiteStateMachine(); // Main FSM
u8 read_input(); // Read input from UART
u8 read_input_timeout(); // Read input from UART w/ timeout
const char* getEnum(direction e);

u32 RNG_get(); // Read RNG from LFSR hardware block
void initialize_snake();
void select_option(int currentIndex); // activate the highlighted option
void move_cursor_up(int* currentIndex);
void move_cursor_down(int* currentIndex);
void increase_volume();
void decrease_volume();
void toggle_roaming();
void play_apple_sound_effect();
void play_crash_sound_effect();
void change_direction(direction* newDirection, direction dir);
void extend_snake();
void spawn_apple(u32 &location);
void update_score();
void clear_inputs();
void query_input(u8 input, direction& currentDirection, direction& newDirection, XTime& tStart, XTime& tEnd, XTime& tPausedStart, XTime& tPausedEnd, XTime& tPauseElapsed, bool readInput = true);
void moveApple(u32 &pos, u8 &dir); // move apple one position in the given direction


/* ---------------------------------------------------------------------------- *
 * 						Redefinitions from xparameters.h 						*
 * ---------------------------------------------------------------------------- */
#define UART_BASEADDR XPAR_PS7_UART_1_BASEADDR



