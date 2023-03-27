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
		gameover,
		options_menu
	};

	enum SnakeDirection
	{
		North,
		South,
		East,
		West
	};

	enum SnakeColor
	{
		green,
		blue,
		red,
		__SnakeColorCount__
	};

	enum FoodSprite
	{
		apple,
		orange,
		cherry,
		meat,
		cheese,
		__FoodSpriteCount__
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

	void SetApplePosition(u32 &xPos, u32 &yPos);
	void MoveApplePosition(u32 &xPos, u32 &yPos, u8 &dir);
	void GetApplePosition(u32& outX, u32& outY);

	void GetGameplayBackground(u32* background);

	void Render(state gameState, bool showHead = true, bool renderSnake = true, bool highScore = false, int cursorPosition = 0, int volume = 5, bool moving_snake = 0);

	void AltRender(SnakeDirection direction, bool showHead = true, bool renderSnake = true, bool highScore = false);

	void AltDrawDirectionfulSnakeComponent(SnakeDirection thisDirection, SnakeDirection nextDirection,
			s32 xPos, s32 yPos,
			snake::render::Sprite* ns,
			snake::render::Sprite* nw,
			snake::render::Sprite* ne,
			snake::render::Sprite* ew,
			snake::render::Sprite* en,
			snake::render::Sprite* es,
			snake::render::Sprite* sn,
			snake::render::Sprite* sw,
			snake::render::Sprite* se,
			snake::render::Sprite* we,
			snake::render::Sprite* wn,
			snake::render::Sprite* ws
			);


	void move_snake(SnakeDirection currentDirection);

	//void toggle_pause();

	void UpdateScore();
	void ResetScore();
	u32 GetScore();
	bool IsHighScore(u32 score);

	void GetHighScores(u32 outHighScores[5]);
	void UpdateHighScores(u32 score);

	void PrintScore(u32 score, u32 xPos, u32 yPos, bool showScoreWord = true);

	bool UpdateTime(u32 us);
	void ResetTime();
	u32 GetTime();

	void PrintTime(u32 seconds, u32 xPos, u32 yPos);

	void SetHardMode(bool isHardMode);
	bool GetHardMode();

	u64 GetTimeOut(u64 baseTimeOut);

	void SetSnakeColor(SnakeColor newColor);
	SnakeColor GetSnakeColor();

	void SetFoodSprite(FoodSprite newFood);
	FoodSprite GetFoodSprite();

	void GetFoodSprite(snake::render::Sprite*& outSprite);

	// not all the sprites!
	// this may do a number on our perf.
	void GetSnakeSprite(
			bool isOffFrame,

			snake::render::Sprite*& headN,
			snake::render::Sprite*& headW,
			snake::render::Sprite*& headS,
			snake::render::Sprite*& headE,

			snake::render::Sprite*& lEW,
			snake::render::Sprite*& dEW,

			snake::render::Sprite*& lSN,
			snake::render::Sprite*& dSN,

			snake::render::Sprite*& lNE,
			snake::render::Sprite*& lWN,
			snake::render::Sprite*& lSW,
			snake::render::Sprite*& lES,

			snake::render::Sprite*& dNE,
			snake::render::Sprite*& dWN,
			snake::render::Sprite*& dSW,
			snake::render::Sprite*& dES,

			snake::render::Sprite*& taillN,
			snake::render::Sprite*& taillW,
			snake::render::Sprite*& taillS,
			snake::render::Sprite*& taillE,

			snake::render::Sprite*& taildN,
			snake::render::Sprite*& taildW,
			snake::render::Sprite*& taildS,
			snake::render::Sprite*& taildE
		);
}

#endif // SNAKEHELPER_H
