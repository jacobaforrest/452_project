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

	void Render(state gameState, bool showHead, bool renderSnake, bool highScore, int cursorPosition, int volume)
	{
		switch(gameState)
		{
			case main_menu:
			{
				snake::render::ClearCanvas(snake::render::GetCanvas());

				// Snake
				snake::render::PaintToCanvas(
					snake::render::GetCanvas(),
					snake::render::GetSprite(snake::sprites::Snake),
					213,
					96
				);


				// ADJUST VOLUME
				snake::render::PaintToCanvas(
					snake::render::GetCanvas(),
					snake::render::GetSprite(snake::sprites::ADJUST),
					213,
					160
				);

				snake::render::PaintToCanvas(
					snake::render::GetCanvas(),
					snake::render::GetSprite(snake::sprites::VOLUME),
					373,
					160
				);

				// HIGH SCORE
				snake::render::PaintToCanvas(
					snake::render::GetCanvas(),
					snake::render::GetSprite(snake::sprites::VIEW),
					213,
					224
				);

				snake::render::PaintToCanvas(
					snake::render::GetCanvas(),
					snake::render::GetSprite(snake::sprites::HIGH),
					335,
					224
				);

				snake::render::PaintToCanvas(
					snake::render::GetCanvas(),
					snake::render::GetSprite(snake::sprites::SCORES),
					449,
					224
				);

				// START
				snake::render::PaintToCanvas(
					snake::render::GetCanvas(),
					snake::render::GetSprite(snake::sprites::START),
					213,
					288
				);

				// ARROW
				switch(cursorPosition)
				{
					case 0: // ADJUST VOLUME
					{
						snake::render::PaintToCanvas(
							snake::render::GetCanvas(),
							snake::render::GetSprite(snake::sprites::arrow),
							128,
							160
						);
						break;
					}
					case 1: // HIGHSCORE
					{
						snake::render::PaintToCanvas(
							snake::render::GetCanvas(),
							snake::render::GetSprite(snake::sprites::arrow),
							128,
							224
						);
						break;
					}
					case 2: // PLAY GAME
					{
						snake::render::PaintToCanvas(
							snake::render::GetCanvas(),
							snake::render::GetSprite(snake::sprites::arrow),
							128,
							288
						);
						break;
					}
					default:
					{
						break;
					}
				}

				break;
			}
			case volume_menu:
			{
				snake::render::ClearCanvas(snake::render::GetCanvas());

				// Snake
				snake::render::PaintToCanvas(
					snake::render::GetCanvas(),
					snake::render::GetSprite(snake::sprites::Snake),
					213,
					96
				);

				// Volume
				snake::render::PaintToCanvas(
					snake::render::GetCanvas(),
					snake::render::GetSprite(snake::render::getEnumNum(volume)),
					213,
					160
				);
				if (volume == 10)
				{
					snake::render::PaintToCanvas(
						snake::render::GetCanvas(),
						snake::render::GetSprite(snake::render::getEnumNum(0)),
						239,
						160
					);
				}


				// INCREASE VOLUME
				snake::render::PaintToCanvas(
					snake::render::GetCanvas(),
					snake::render::GetSprite(snake::sprites::INCREASE),
					213,
					224
				);

				snake::render::PaintToCanvas(
					snake::render::GetCanvas(),
					snake::render::GetSprite(snake::sprites::VOLUME),
					420,
					224
				);

				// DECREASE VOLUME
				snake::render::PaintToCanvas(
					snake::render::GetCanvas(),
					snake::render::GetSprite(snake::sprites::DECREASE),
					213,
					288
				);

				snake::render::PaintToCanvas(
					snake::render::GetCanvas(),
					snake::render::GetSprite(snake::sprites::VOLUME),
					420,
					288
				);

				// RETURN
				snake::render::PaintToCanvas(
					snake::render::GetCanvas(),
					snake::render::GetSprite(snake::sprites::RETURN),
					213,
					352
				);

				// ARROW
				switch(cursorPosition)
				{
					case 3: // INCREASE VOLUME
					{
						snake::render::PaintToCanvas(
							snake::render::GetCanvas(),
							snake::render::GetSprite(snake::sprites::arrow),
							128,
							224
						);
						break;
					}
					case 4: // DECREASE VOLUME
					{
						snake::render::PaintToCanvas(
							snake::render::GetCanvas(),
							snake::render::GetSprite(snake::sprites::arrow),
							128,
							288
						);
						break;
					}
					case 5: // RETURN
					{
						snake::render::PaintToCanvas(
							snake::render::GetCanvas(),
							snake::render::GetSprite(snake::sprites::arrow),
							128,
							352
						);
						break;
					}
					default:
					{
						break;
					}
				}

				break;
			}
			case highscore_menu:
			{
				snake::render::ClearCanvas(snake::render::GetCanvas());

				// Snake
				snake::render::PaintToCanvas(
					snake::render::GetCanvas(),
					snake::render::GetSprite(snake::sprites::Snake),
					213,
					32
				);


				// I
				snake::render::PaintToCanvas(
					snake::render::GetCanvas(),
					snake::render::GetSprite(snake::sprites::I),
					213,
					96
				);

				snake::render::PaintToCanvas(
					snake::render::GetCanvas(),
					snake::render::GetSprite(snake::sprites::nine),
					341,
					96
				);

				// II
				snake::render::PaintToCanvas(
					snake::render::GetCanvas(),
					snake::render::GetSprite(snake::sprites::II),
					213,
					160
				);

				snake::render::PaintToCanvas(
					snake::render::GetCanvas(),
					snake::render::GetSprite(snake::sprites::eight),
					341,
					160
				);

				// III
				snake::render::PaintToCanvas(
					snake::render::GetCanvas(),
					snake::render::GetSprite(snake::sprites::III),
					213,
					224
				);

				snake::render::PaintToCanvas(
					snake::render::GetCanvas(),
					snake::render::GetSprite(snake::sprites::seven),
					341,
					224
				);


				// IV
				snake::render::PaintToCanvas(
					snake::render::GetCanvas(),
					snake::render::GetSprite(snake::sprites::IV),
					213,
					288
				);
				snake::render::PaintToCanvas(
					snake::render::GetCanvas(),
					snake::render::GetSprite(snake::sprites::six),
					341,
					288
				);

				// V
				snake::render::PaintToCanvas(
					snake::render::GetCanvas(),
					snake::render::GetSprite(snake::sprites::V),
					213,
					352
				);
				snake::render::PaintToCanvas(
					snake::render::GetCanvas(),
					snake::render::GetSprite(snake::sprites::five),
					341,
					352
				);


				// RETURN
				snake::render::PaintToCanvas(
					snake::render::GetCanvas(),
					snake::render::GetSprite(snake::sprites::RETURN),
					213,
					416
				);


				// ARROW
				snake::render::PaintToCanvas(
					snake::render::GetCanvas(),
					snake::render::GetSprite(snake::sprites::arrow),
					128,
					416
				);

				break;
			}

			case gameplay:
			{
				snake::render::DrawBackground(snake::render::GetCanvas(), background);

				// snake head
				if(snakeComponents[0].m_init)
				{
					snake::render::Sprite* head = NULL;

					switch(snakeComponents[0].m_direction)
					{
						case North:
						{
							head = snake::render::GetSprite(snake::sprites::headN);
							break;
						}
						case South:
						{
							head = snake::render::GetSprite(snake::sprites::headS);
							break;
						}
						case East:
						{
							head = snake::render::GetSprite(snake::sprites::headE);
							break;
						}
						case West:
						{
							head = snake::render::GetSprite(snake::sprites::headW);
							break;
						}

						assert(head);
					}

					snake::render::PaintToCanvas(
						snake::render::GetCanvas(),
						head,
						snakeComponents[0].m_xPos,
						snakeComponents[0].m_yPos
					);
				}

				// snake body
				int index = 1;

				snake::render::Sprite* body1 = snake::render::GetSprite(snake::sprites::body1);
				snake::render::Sprite* body2 = snake::render::GetSprite(snake::sprites::body2);

				while(snakeComponents[index].m_init)
				{
					if((index & 1) == 0)
					{
						snake::render::PaintToCanvas(
							snake::render::GetCanvas(),
							body1,
							snakeComponents[index].m_xPos,
							snakeComponents[index].m_yPos
						);
					}
					else
					{
						snake::render::PaintToCanvas(
							snake::render::GetCanvas(),
							body2,
							snakeComponents[index].m_xPos,
							snakeComponents[index].m_yPos
						);
					}

					++index;
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
}


