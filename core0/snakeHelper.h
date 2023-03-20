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

	void Render(state gameState, bool showHead = true, bool renderSnake = true, bool highScore = false);

	void AltRender(bool showHead = true, bool renderSnake = true, bool highScore = false);

	void DrawDirectionfulSnakeComponent(SnakeDirection thisDirection, SnakeDirection nextDirection,
											s32 xPos, s32 yPos,
											snake::render::Sprite* horizontal, snake::render::Sprite* vertical,
											snake::render::Sprite* nw, snake::render::Sprite* ne,
											snake::render::Sprite* sw, snake::render::Sprite* se);

	void move_snake(SnakeDirection currentDirection);

	void UpdateScore();
	void ResetScore();
	u32 GetScore();

	void GetHighScores(u32 outHighScores[5]);
	void UpdateHighScores(u32 score);

	void PrintScore(u32 score, u32 xPos, u32 yPos);
	void PrintHighScores(u32 xPos, u32 yPos);

	bool UpdateTime(u32 us);
	void ResetTime();
	u32 GetTime();

	void PrintTime(u32 seconds, u32 xPos, u32 yPos);

	void SetHardMode(bool isHardMode);

	u64 GetTimeOut(u64 baseTimeOut);
}

#endif // SNAKEHELPER_H
