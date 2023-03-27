
/* ---------------------------------------------------------------------------- *
 * 								Header Files									*
 * ---------------------------------------------------------------------------- */
#include <stdio.h>
#include <xil_io.h>
#include <sleep.h>
// #include "xiicps.h" // is this even being used?
#include <xil_printf.h>
#include <xparameters.h>
#include <xbasic_types.h>
//#include "xgpio.h"
#include "xuartps.h"
#include "stdlib.h"
#include "xtime_l.h"
#include "xil_mmu.h"
#include "xscugic.h"
#include "xtmrctr.h"

#include "snakeHelper.h"


/* ---------------------------------------------------------------------------- *
 * 							   Type Definitions								    *
 * ---------------------------------------------------------------------------- */

#define state snake::state
#define direction snake::SnakeDirection


/* ---------------------------------------------------------------------------- *
 * 							Prototype Functions									*
 * ---------------------------------------------------------------------------- */
void finiteStateMachine();
u8 read_input();
u8 read_input_timeout();
const char* getEnum(direction e);

//Stub Functions
u32 RNG_get();
void draw_main_menu(int currentIndex);
void draw_volume_menu(int currentIndex);
void draw_highscore_menu(int currentIndex);
void draw_options_menu(int currentIndex, int sideDirection);
void draw_grid();
void initialize_snake();
void select_option(int currentIndex);
void move_cursor_up(int* currentIndex);
void move_cursor_down(int* currentIndex);
void increase_volume();
void decrease_volume();
void start_game();
void draw_gameover_menu(int currentIndex);
void menu_return();
void play_apple_sound_effect();
void play_crash_sound_effect();
void change_direction(direction* newDirection, direction dir);
void extend_snake();
void spawn_apple(u32 location);
void consume_apple();
void pause_game();
void resume_game();
void update_score();
void clear_inputs();
void query_input(u8 input, direction& currentDirection, direction& newDirection, XTime& tStart, XTime& tEnd, XTime& tPausedStart, XTime& tPausedEnd, XTime& tPauseElapsed);



/* ---------------------------------------------------------------------------- *
 * 						Redefinitions from xparameters.h 						*
 * ---------------------------------------------------------------------------- */
#define UART_BASEADDR XPAR_PS7_UART_1_BASEADDR



