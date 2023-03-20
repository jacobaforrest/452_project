#include "snakeHelper.h"

#include <xil_printf.h>

#include <cassert>
#include "stdlib.h"

#include "input.h"
#include "render.h"
#include "sprites.h"
#include "collision.h"

namespace snake
{
	SnakeComponent snakeComponents[GRID_SIZE * GRID_SIZE];
	u32 nextBody = 0;

	u32 appleX = 0, appleY = 0;

	u32* background = NULL;

	u32 spawnX = 0, spawnY = 0;
	SnakeDirection spawnDirection = East;

	u32 score = 0;
	u32 appleGetCount = 0;

	u32 usTime = 0;
	u32 sTime = 0;

	u32 highScores[5] = {200,100,50,20,10};

	bool hardMode = false;

	void Init()
	{
		snake::render::Init();

		snake_InitInterrupt();

		background = (u32*) malloc(CANVAS_WIDTH * CANVAS_HEIGHT * sizeof(u32));
		GetGameplayBackground(background);
	}

	void DeInit()
	{
		free(background);
	}

	void ExtendSnake()
	{
		snakeComponents[nextBody].m_xPos = spawnX;
		snakeComponents[nextBody].m_yPos = spawnY;
		snakeComponents[nextBody].m_direction = spawnDirection;

		snakeComponents[nextBody].m_init = true;

		snakeComponents[nextBody - 1].m_next = &snakeComponents[nextBody];

		++nextBody;
	}

	void InitSnakeComponents()
	{
		ResetSnakeComponents();

		snakeComponents[0].m_xPos = SNAKE_START_X;
		snakeComponents[0].m_yPos = SNAKE_START_Y;
		snakeComponents[0].m_direction = East;
		snakeComponents[0].m_init = true;

		nextBody = 1;
	}

	void ResetSnakeComponents()
	{
		for(int i = 0; i < GRID_SIZE * GRID_SIZE; ++i)
		{
			snakeComponents[i].m_init = false;
		}
	}

	SnakeComponent* GetHead()
	{
		return snakeComponents;
	}

	void SetApplePosition(u32 xPos, u32 yPos)
	{
		u32 startX = xPos;
		u32 startY = yPos;

		appleX = xPos;
		appleY = yPos;

		while((snake::collision::DetectCollision() & snake::collision::bodyApple) != 0)
		{
			appleX = appleX + 1;

			if(appleX >= GRID_SIZE)
			{
				appleX = 0;
				appleY = (appleY + 1) % GRID_SIZE;
			}

			if(startX == appleX && startY == appleY)
			{
				break;
			}
		}


		xil_printf("Spawning Apple with coordinates: %i, %i\r\n", appleX, appleY);
	}

	void GetApplePosition(u32& outX, u32& outY)
	{
		outX = appleX;
		outY = appleY;
	}

	void GetGameplayBackground(u32* background)
	{
		const s32 gridSize = 13;
		const s32 step = 32;
		const s32 xStart = 112;
		const s32 yStart = 48;

		const snake::render::Sprite* sprite = snake::render::GetSprite(snake::sprites::bg);

		snake::render::ClearCanvas(background);

		for(s32 x = 0; x < gridSize; ++x)
		{
			for(s32 y = 0; y < gridSize; ++y)
			{
				snake::render::PaintToCanvas(background, sprite, xStart + x * step, yStart + y * step);
			}
		}
	}

	void Render(state gameState, bool showHead, bool renderSnake, bool highScore)
	{
		switch(gameState)
		{
			case main_menu:
			{
				break;
			}
			case volume_menu:
			{
				break;
			}
			case highscore_menu:
			{
				break;
			}
			case pre_gameover:
			case gameplay:
			{
				snake::render::DrawBackground(snake::render::GetCanvas(), background);

				PrintTime(GetTime(), 32, 0);
				PrintScore(GetScore(), 288, 0);

				// snake head
				if(snakeComponents[0].m_init)
				{
					snake::render::Sprite* head = NULL;

					switch(snakeComponents[0].m_direction)
					{
						case North:
						{
							head = snake::render::GetSprite(snake::sprites::headN1);
							break;
						}
						case South:
						{
							head = snake::render::GetSprite(snake::sprites::headS1);
							break;
						}
						case East:
						{
							head = snake::render::GetSprite(snake::sprites::headE1);
							break;
						}
						case West:
						{
							head = snake::render::GetSprite(snake::sprites::headW1);
							break;
						}

						assert(head);
					}

					if(showHead)
					{
						snake::render::PaintToCanvas(
							snake::render::GetCanvas(),
							head,
							snakeComponents[0].m_xPos,
							snakeComponents[0].m_yPos
						);
					}
				}

				// snake body
				int index = 1;

				if(renderSnake)
				{
					while(snakeComponents[index].m_init && snakeComponents[index + 1].m_init)
					{
						if((index & 1) == 0)
						{
							DrawDirectionfulSnakeComponent(snakeComponents[index - 1].m_direction, snakeComponents[index].m_direction,
									snakeComponents[index].m_xPos, snakeComponents[index].m_yPos,
									snake::render::GetSprite(snake::sprites::bodyLightH1),
									snake::render::GetSprite(snake::sprites::bodyLightV1),
									snake::render::GetSprite(snake::sprites::bodyLightNW1),
									snake::render::GetSprite(snake::sprites::bodyLightNE1),
									snake::render::GetSprite(snake::sprites::bodyLightSW1),
									snake::render::GetSprite(snake::sprites::bodyLightSE1)
								);
						}
						else
						{
							DrawDirectionfulSnakeComponent(snakeComponents[index - 1].m_direction, snakeComponents[index].m_direction,
									snakeComponents[index].m_xPos, snakeComponents[index].m_yPos,
									snake::render::GetSprite(snake::sprites::bodyDarkH1),
									snake::render::GetSprite(snake::sprites::bodyDarkV1),
									snake::render::GetSprite(snake::sprites::bodyDarkNW1),
									snake::render::GetSprite(snake::sprites::bodyDarkNE1),
									snake::render::GetSprite(snake::sprites::bodyDarkSW1),
									snake::render::GetSprite(snake::sprites::bodyDarkSE1)
								);
						}

						++index;
					}

					// snake tail
					if(snakeComponents[index].m_init)
					{
						snake::render::Sprite* tail = NULL;

						if((index & 1) == 0)
						{
							switch(snakeComponents[index - 1].m_direction)
							{
								case North:
								tail = snake::render::GetSprite(snake::sprites::tailLightN1);
								break;
								case South:
								tail = snake::render::GetSprite(snake::sprites::tailLightS1);
								break;
								case East:
								tail = snake::render::GetSprite(snake::sprites::tailLightE1);
								break;
								case West:
								tail = snake::render::GetSprite(snake::sprites::tailLightW1);
								default:
								break;
							}
						}
						else
						{
							switch(snakeComponents[index - 1].m_direction)
							{
								case North:
								tail = snake::render::GetSprite(snake::sprites::tailDarkN1);
								break;
								case South:
								tail = snake::render::GetSprite(snake::sprites::tailDarkS1);
								break;
								case East:
								tail = snake::render::GetSprite(snake::sprites::tailDarkE1);
								break;
								case West:
								tail = snake::render::GetSprite(snake::sprites::tailDarkW1);
								default:
								break;
							}
						}

						snake::render::PaintToCanvas(
							snake::render::GetCanvas(),
							tail,
							snakeComponents[index].m_xPos,
							snakeComponents[index].m_yPos
						);
					}
				}

				// draw apple
				snake::render::PaintToCanvas(
					snake::render::GetCanvas(),
					snake::render::GetSprite(snake::sprites::apple),
					GRID_START_X + appleX * FOOD_BOUNDS,
					GRID_START_Y + appleY * FOOD_BOUNDS
				);

				break;
			}
			case gameover:
			{
				snake::render::ClearCanvas(snake::render::GetCanvas());

				snake::render::PaintToCanvas(
					snake::render::GetCanvas(),
					snake::render::GetSprite(snake::sprites::dead),
					256,
					176
				);

				snake::render::PaintToCanvas(
					snake::render::GetCanvas(),
					snake::render::GetSprite(snake::sprites::RETURN),
					240,
					432
				);

				snake::render::PaintToCanvas(
					snake::render::GetCanvas(),
					snake::render::GetSprite(snake::sprites::arrow),
					202,
					432
				);

				break;
			}
			default:
			{
				break;
			}
		}

		snake::render::Draw();
		snake::render::Draw();
		snake::render::Draw();
		snake::render::Draw();
	}

	void AltRender(bool showHead, bool renderSnake, bool highScore)
	{

	}

	void DrawDirectionfulSnakeComponent(SnakeDirection thisDirection, SnakeDirection nextDirection,
										s32 xPos, s32 yPos,
										snake::render::Sprite* horizontal, snake::render::Sprite* vertical, snake::render::Sprite* nw, snake::render::Sprite* ne, snake::render::Sprite* sw, snake::render::Sprite* se)
	{
		snake::render::Sprite* drawingSprite = NULL;

		if(thisDirection == North)
		{
			if(nextDirection == North || nextDirection == South)
			{
				drawingSprite = vertical;
			}
			else if(nextDirection == East)
			{
				drawingSprite = nw;
			}
			else if(nextDirection == West)
			{
				drawingSprite = ne;
			}
		}
		else if (thisDirection == South)
		{
			if(nextDirection == North || nextDirection == South)
			{
				drawingSprite = vertical;
			}
			else if(nextDirection == East)
			{
				drawingSprite = sw;
			}
			else if(nextDirection == West)
			{
				drawingSprite = se;
			}
		}
		else if (thisDirection == East)
		{
			if(nextDirection == East || nextDirection == West)
			{
				drawingSprite = horizontal;
			}
			else if(nextDirection == North)
			{
				drawingSprite = se;
			}
			else if(nextDirection == South)
			{
				drawingSprite = ne;
			}
		}
		else // West
		{
			if(nextDirection == East || nextDirection == West)
			{
				drawingSprite = horizontal;
			}
			else if(nextDirection == North)
			{
				drawingSprite = sw;
			}
			else if(nextDirection == South)
			{
				drawingSprite = nw;
			}
		}

		if(drawingSprite)
		{
			snake::render::PaintToCanvas(
				snake::render::GetCanvas(),
				drawingSprite,
				xPos,
				yPos
			);
		}
	}

	void move_snake(SnakeDirection currentDirection)
	{
		xil_printf("Snake moved forward one unit\r\n");

		spawnX = snakeComponents[nextBody - 1].m_xPos;
		spawnY = snakeComponents[nextBody - 1].m_yPos;
		spawnDirection = snakeComponents[nextBody - 1].m_direction;

		for(int i = nextBody - 1; i > 0; --i)
		{
			snakeComponents[i].m_xPos = snakeComponents[i - 1].m_xPos;
			snakeComponents[i].m_yPos = snakeComponents[i - 1].m_yPos;
			snakeComponents[i].m_direction = snakeComponents[i - 1].m_direction;
		}

		snakeComponents[0].m_direction = currentDirection;

		switch(currentDirection)
		{
			case North:
			{
				snakeComponents[0].m_yPos -= SNAKE_BOUNDS;
				break;
			}
			case South:
			{
				snakeComponents[0].m_yPos += SNAKE_BOUNDS;
				break;
			}
			case East:
			{
				snakeComponents[0].m_xPos += SNAKE_BOUNDS;
				break;
			}
			case West:
			{
				snakeComponents[0].m_xPos -= SNAKE_BOUNDS;
				break;
			}
		}
	}

	void UpdateScore()
	{
		++appleGetCount;

		if(score < 100)
		{
			score += 10;
		}
		else if(score < 1000)
		{
			score += 100;
		}
		else if(score < 10000)
		{
			score += 1000;
		}
		else
		{
			score += 10000;
		}
	}

	void ResetScore()
	{
		score = 0;
		appleGetCount = 0;
	}

	u32 GetScore()
	{
		return score;
	}

	void GetHighScores(u32 outHighScores[5])
	{
		for(int i = 0; i < 5; ++i)
		{
			outHighScores[i] = highScores[i];
		}
	}

	void UpdateHighScores(u32 score)
	{
		if(score > highScores[4])
		{
			highScores[4] = score;

			for(int i = 4; i > 0; --i)
			{
				if(highScores[i] > highScores[i - 1])
				{
					u32 temp = highScores[i - 1];
					highScores[i - 1] = highScores[i];
					highScores[i] = temp;
				}
			}
		}
	}

	void PrintScore(u32 score, u32 xPos, u32 yPos)
	{
		const snake::sprites::SpriteIndex indicies[] =
		{
			snake::sprites::zero,
			snake::sprites::one,
			snake::sprites::two,
			snake::sprites::three,
			snake::sprites::four,
			snake::sprites::five,
			snake::sprites::six,
			snake::sprites::seven,
			snake::sprites::eight,
			snake::sprites::nine
		};

		snake::sprites::SpriteIndex millions, hundredthousands, tenthousands, thousands, hundreds, tens, ones;

		// this could prob be turned into a function. too bad!
		millions = indicies[score / 1000000];
		score -= (score / 1000000) * 1000000;
		hundredthousands = indicies[score / 100000];
		score -= (score / 100000) * 100000;
		tenthousands = indicies[score / 10000];
		score -= (score / 10000) * 10000;
		thousands = indicies[score / 1000];
		score -= (score / 1000) * 1000;
		hundreds = indicies[score / 100];
		score -= (score / 100) * 100;
		tens = indicies[score / 10];
		score -= (score / 10) * 10;
		ones = indicies[score];

		snake::render::PaintToCanvas(
			snake::render::GetCanvas(),
			snake::render::GetSprite(snake::sprites::SCORE),
			xPos,
			yPos
		);

		xPos += snake::sprites::SpriteWidths[snake::sprites::SCORE];

		// this is almost the worst code i've written...
		bool nonZero = false;
		nonZero = nonZero || millions != snake::sprites::zero;
		if(nonZero)
		{
			snake::render::PaintToCanvas(
				snake::render::GetCanvas(),
				snake::render::GetSprite(millions),
				xPos,
				yPos
			);
		}
		xPos += snake::sprites::SpriteWidths[millions];

		nonZero = nonZero || hundredthousands != snake::sprites::zero;
		if(nonZero)
		{
			snake::render::PaintToCanvas(
				snake::render::GetCanvas(),
				snake::render::GetSprite(hundredthousands),
				xPos,
				yPos
			);
		}
		xPos += snake::sprites::SpriteWidths[hundredthousands];

		nonZero = nonZero || tenthousands != snake::sprites::zero;
		if(nonZero)
		{
			snake::render::PaintToCanvas(
				snake::render::GetCanvas(),
				snake::render::GetSprite(tenthousands),
				xPos,
				yPos
			);
		}
		xPos += snake::sprites::SpriteWidths[tenthousands];

		nonZero = nonZero || thousands != snake::sprites::zero;
		if(nonZero)
		{
			snake::render::PaintToCanvas(
				snake::render::GetCanvas(),
				snake::render::GetSprite(thousands),
				xPos,
				yPos
			);
		}
		xPos += snake::sprites::SpriteWidths[thousands];

		nonZero = nonZero || hundreds != snake::sprites::zero;
		if(nonZero)
		{
			snake::render::PaintToCanvas(
				snake::render::GetCanvas(),
				snake::render::GetSprite(hundreds),
				xPos,
				yPos
			);
		}
		xPos += snake::sprites::SpriteWidths[hundreds];

		nonZero = nonZero || tens != snake::sprites::zero;
		if(nonZero)
		{
			snake::render::PaintToCanvas(
				snake::render::GetCanvas(),
				snake::render::GetSprite(tens),
				xPos,
				yPos
			);
		}
		xPos += snake::sprites::SpriteWidths[tens];

		snake::render::PaintToCanvas(
			snake::render::GetCanvas(),
			snake::render::GetSprite(ones),
			xPos,
			yPos
		);
	}

	void PrintHighScores(u32 xPos, u32 yPos)
	{

	}

	bool UpdateTime(u32 us)
	{
		usTime += us;

		if(usTime >= 1000000)
		{
			usTime -= 1000000;
			++sTime;
			return true;
		}

		return false;
	}

	void ResetTime()
	{
		usTime = 0;
		sTime = 0;
	}

	u32 GetTime()
	{
		return sTime;
	}

	void PrintTime(u32 seconds, u32 xPos, u32 yPos)
	{
		const snake::sprites::SpriteIndex indicies[] =
		{
			snake::sprites::zero,
			snake::sprites::one,
			snake::sprites::two,
			snake::sprites::three,
			snake::sprites::four,
			snake::sprites::five,
			snake::sprites::six,
			snake::sprites::seven,
			snake::sprites::eight,
			snake::sprites::nine
		};

		snake::sprites::SpriteIndex hundreds, tens, ones;

		if(seconds >= 999)
		{
			hundreds = tens = ones = indicies[9];
		}
		else
		{
			// this could prob be turned into a function. too bad!
			hundreds = indicies[seconds / 100];
			seconds -= (seconds / 100) * 100;
			tens = indicies[seconds / 10];
			seconds -= (seconds / 10) * 10;
			ones = indicies[seconds];
		}

		snake::render::PaintToCanvas(
			snake::render::GetCanvas(),
			snake::render::GetSprite(snake::sprites::clock),
			xPos,
			yPos
		);

		xPos += snake::sprites::SpriteWidths[snake::sprites::clock];

		bool nonZero = false;
		nonZero = nonZero || hundreds != snake::sprites::zero;
		if(nonZero)
		{
			snake::render::PaintToCanvas(
				snake::render::GetCanvas(),
				snake::render::GetSprite(hundreds),
				xPos,
				yPos
			);
		}
		xPos += snake::sprites::SpriteWidths[hundreds];

		nonZero = nonZero || tens != snake::sprites::zero;
		if(nonZero)
		{
			snake::render::PaintToCanvas(
				snake::render::GetCanvas(),
				snake::render::GetSprite(tens),
				xPos,
				yPos
			);
		}
		xPos += snake::sprites::SpriteWidths[tens];

		snake::render::PaintToCanvas(
			snake::render::GetCanvas(),
			snake::render::GetSprite(ones),
			xPos,
			yPos
		);
	}

	void SetHardMode(bool isHardMode)
	{
		hardMode = isHardMode;
	}

	u64 GetTimeOut(u64 baseTimeOut)
	{
		if(!hardMode)
		{
			return baseTimeOut;
		}

		// stub. will have altered time in hard mode.
		return baseTimeOut;
	}
}
