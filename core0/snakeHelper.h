#ifndef SNAKEHELPER_H
#define SNAKEHELPER_H

#define SNAKE_BOUNDS 32
#define FOOD_BOUNDS 32

#define GRID_SIZE 13
#define GRID_START_X 112
#define GRID_START_Y 48

#define SNAKE_START_X 304
#define SNAKE_START_Y 240

#include "xil_types.h"

namespace snake
{
	namespace render
	{
		struct Sprite;
	}

	enum state
	{
		main_menu,
		volume_menu,
		highscore_menu,
		gameplay,
		pre_gameover,
		gameover
	};

	enum SnakeDirection
	{
		North,
		South,
		East,
		West
	};

	struct SnakeComponent
	{
		u32 m_xPos, m_yPos;
		SnakeDirection m_direction;

		SnakeComponent* m_next;

		bool m_init;
	};

	void Init();
	void DeInit();

	void ExtendSnake();

	void InitSnakeComponents();
	void ResetSnakeComponents();

	SnakeComponent* GetHead();

	void SetApplePosition(u32 xPos, u32 yPos);
	void GetApplePosition(u32& outX, u32& outY);

	void GetGameplayBackground(u32* background);

	void Render(state gameState, bool showHead = true, bool renderSnake = true, bool highScore = false, int cursorPosition = 0, int volume = 5);

	void move_snake(SnakeDirection currentDirection);


}

#endif // SNAKEHELPER_H
