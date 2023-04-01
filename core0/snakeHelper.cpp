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

	//bool paused = false;

	bool hardMode = false;
	SnakeColor snakeColor = green;
	FoodSprite foodSprite = apple;

	void Init()
	{
		snake::render::Init();

		//snake_InitInterrupt();

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

		snakeComponents[1].m_xPos = SNAKE_START_X - 32;
		snakeComponents[1].m_yPos = SNAKE_START_Y;
		snakeComponents[1].m_direction = East;
		snakeComponents[1].m_init = true;

		snakeComponents[0].m_next = &snakeComponents[1];

		nextBody = 2;
	}

	void ResetSnakeComponents()
	{
		for(int i = 0; i < GRID_SIZE * GRID_SIZE; ++i)
		{
			snakeComponents[i].m_init = false;
		}
	}

	int GetComponentCount()
	{
		return nextBody;
	}

	SnakeComponent* GetHead()
	{
		return snakeComponents;
	}

	void SetApplePosition(u32 &xPos, u32 &yPos)
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

		xPos = appleX;
		yPos = appleY;


		// xil_printf("Spawning Apple with coordinates: %i, %i\r\n", appleX, appleY);
	}

	void MoveApplePosition(u32 &xPos, u32 &yPos, u8 &dir)
	{

		appleX = xPos;
		appleY = yPos;

		// xil_printf("Apple direction: %i\r\n", dir);
		// xil_printf("xPos: %i\r\n", xPos);
		// xil_printf("yPos: %i\r\n", yPos);

		if (dir == 0){ // moving right
			if (appleX >= GRID_SIZE - 1) // apple on the far right
			{
				dir = 1; // change direction to begin moving left
				appleX = GRID_SIZE - 2; // move apple 1 left
				if ((snake::collision::DetectCollision() & snake::collision::bodyApple) != 0){ // if collision with snake
					dir = 0; // undo direction change
					appleX = xPos; // undo apple move
					//return; // apple stuck between right wall and snake segment
				}
				else{ // no collision with snake (update xPos)
					xPos = appleX;
				}
			}
			else{ // apple not on the far right
				appleX = xPos + 1; // move apple 1 right
				if ((snake::collision::DetectCollision() & snake::collision::apple) != 0){ //apple will be consumed next iteration
					appleX = xPos; // undo apple move
				}
				else if ((snake::collision::DetectCollision() & snake::collision::bodyApple) != 0){ // if collision with snake
					dir = 1; // change direction
					appleX = xPos - 1; //try moving left
					if ((snake::collision::DetectCollision() & snake::collision::bodyApple) != 0 // if collision with snake
							|| (xPos <= 0)){ // if collision with wall
						dir = 0; // change direction
						appleX = xPos; // undo apple move
						//return; // apple stuck between snake segments or left wall and snake segment
					}
					else{
						xPos = appleX;
					}
				}
				else{ // no collision with snake (update xPos)
					xPos = appleX;
				}
			}
		}

		else if (dir == 1){ // moving left
			if (appleX == 0) // apple on the far left
			{
				dir = 0; // change direction to begin moving right
				appleX = 1; // move apple 1 right
				if ((snake::collision::DetectCollision() & snake::collision::bodyApple) != 0){ // if collision with snake
					dir = 1; // undo change direction
					appleX = xPos; // undo apple
					//return; // apple stuck between left wall and snake segment
				}
				else{ // no collision with snake (update xPos)
					xPos = appleX;
				}
			}
			else{ // apple not on the far left
				appleX = xPos - 1; // move apple 1 left
				if ((snake::collision::DetectCollision() & snake::collision::apple) != 0){ //apple will be consumed next iteration
					appleX = xPos; // undo apple move
				}
				else if ((snake::collision::DetectCollision() & snake::collision::bodyApple) != 0){ // if collision with snake
					dir = 0; // change direction
					appleX = xPos + 1; //try moving right
					if ((snake::collision::DetectCollision() & snake::collision::bodyApple) != 0 // if collision with snake
							|| (appleX >= GRID_SIZE - 1)){ // if collision with wall
						dir = 1; // change direction
						appleX = xPos; // undo apple move
						//return; // apple stuck between snake segments or right wall and snake segment
					}
					else{
						xPos = appleX;
					}
				}
				else{ // no collision with snake (update xPos)
					xPos = appleX;
				}
			}
		}
		else if (dir == 2){ // moving up
			if (appleY == 0) // apple on the far top
			{
				dir = 3; // change direction to begin moving down
				appleY = 1; // move apple 1 down
				if ((snake::collision::DetectCollision() & snake::collision::bodyApple) != 0){ // if collision with snake
					dir = 2; // undo direction change
					appleY = yPos; // undo apple move
					//return; // apple stuck between top wall and snake segment
				}
				else{ // no collision with snake (update yPos)
					yPos = appleY;
				}
			}
			else{ // apple not on the far top
				appleY = yPos - 1; // move apple 1 up
				if ((snake::collision::DetectCollision() & snake::collision::apple) != 0){ //apple will be consumed next iteration
					appleY = yPos; // undo apple move
				}
				else if ((snake::collision::DetectCollision() & snake::collision::bodyApple) != 0){ // if collision with snake
					dir = 3; // change direction
					appleY = yPos + 1; //try moving down
					if ((snake::collision::DetectCollision() & snake::collision::bodyApple) != 0 // if collision with snake
							|| (appleY >= GRID_SIZE - 1)){ // if collision with wall
						dir = 2; // change direction
						appleY = yPos; // undo apple move
						//return; // apple stuck between snake segments or bottom wall and snake segment
					}
					else{
						yPos = appleY;
					}
				}
				else{ // no collision with snake (update yPos)
					yPos = appleY;
				}
			}
		}

		else if (dir == 3){ // moving down
			if (appleY == GRID_SIZE - 1) // apple on the far bottom
			{
				dir = 2; // change direction to begin moving up
				appleY = GRID_SIZE - 2; // move apple 1 up
				if ((snake::collision::DetectCollision() & snake::collision::bodyApple) != 0){ // if collision with snake
					dir = 3; // undo change direction
					appleY = yPos; // undo apple
					//return; // apple stuck between left wall and snake segment
				}
				else{ // no collision with snake (update yPos)
					yPos = appleY;
				}
			}
			else{ // apple not on the far bottom
				appleY = yPos + 1; // move apple 1 down
				if ((snake::collision::DetectCollision() & snake::collision::apple) != 0){ //apple will be consumed next iteration
					appleY = yPos; // undo apple move
				}
				else if ((snake::collision::DetectCollision() & snake::collision::bodyApple) != 0){ // if collision with snake
					dir = 2; // change direction
					appleY = yPos - 1; //try moving up
					if ((snake::collision::DetectCollision() & snake::collision::bodyApple) != 0 // if collision with snake
							|| (yPos <= 0)){ // if collision with wall
						dir = 3; // change direction
						appleY = yPos; // undo apple move
						//return; // apple stuck between snake segments or right wall and snake segment
					}
					else{
						yPos = appleY;
					}
				}
				else{ // no collision with snake (update yPos)
					yPos = appleY;
				}
			}
		}

		// xil_printf("Spawning Apple with coordinates: %i, %i\r\n", appleX, appleY);
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

	void Render(state gameState, bool showHead, bool renderSnake, bool highScore, int cursorPosition, int volume, bool moving_apple, int explosionIndex)
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
					213 - 64,
					96
				);


				// ADJUST VOLUME
				snake::render::PaintToCanvas(
					snake::render::GetCanvas(),
					snake::render::GetSprite(snake::sprites::ADJUST),
					213 - 64,
					160
				);

				snake::render::PaintToCanvas(
					snake::render::GetCanvas(),
					snake::render::GetSprite(snake::sprites::VOLUME),
					373 - 64,
					160
				);

				// HIGH SCORE
				snake::render::PaintToCanvas(
					snake::render::GetCanvas(),
					snake::render::GetSprite(snake::sprites::VIEW),
					213 - 64,
					224
				);

				snake::render::PaintToCanvas(
					snake::render::GetCanvas(),
					snake::render::GetSprite(snake::sprites::HIGH),
					335 - 64,
					224
				);

				snake::render::PaintToCanvas(
					snake::render::GetCanvas(),
					snake::render::GetSprite(snake::sprites::SCORES),
					449 - 64,
					224
				);

				// OPTIONS
				snake::render::PaintToCanvas(
					snake::render::GetCanvas(),
					snake::render::GetSprite(snake::sprites::OPTIONS),
					213 - 64,
					288
				);

				// START
				snake::render::PaintToCanvas(
					snake::render::GetCanvas(),
					snake::render::GetSprite(snake::sprites::START),
					213 - 64,
					352
				);

				// ARROW
				switch(cursorPosition)
				{
					case 0: // ADJUST VOLUME
					{
						snake::render::PaintToCanvas(
							snake::render::GetCanvas(),
							snake::render::GetSprite(snake::sprites::arrow),
							128 - 64,
							160
						);
						break;
					}
					case 1: // HIGHSCORE
					{
						snake::render::PaintToCanvas(
							snake::render::GetCanvas(),
							snake::render::GetSprite(snake::sprites::arrow),
							128 - 64,
							224
						);
						break;
					}
					case 2: // PLAY GAME
					{
						snake::render::PaintToCanvas(
							snake::render::GetCanvas(),
							snake::render::GetSprite(snake::sprites::arrow),
							128 - 64,
							352
						);
						break;
					}
					case 6: //OPTIONS
					{
						snake::render::PaintToCanvas(
							snake::render::GetCanvas(),
							snake::render::GetSprite(snake::sprites::arrow),
							128 - 64,
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
					213 - 64,
					96
				);

				// Volume
				snake::render::PaintToCanvas(
					snake::render::GetCanvas(),
					snake::render::GetSprite(snake::render::getEnumNum(volume)),
					213 - 64,
					160
				);
				if (volume == 10)
				{
					snake::render::PaintToCanvas(
						snake::render::GetCanvas(),
						snake::render::GetSprite(snake::render::getEnumNum(0)),
						239 - 64,
						160
					);
				}


				// INCREASE VOLUME
				snake::render::PaintToCanvas(
					snake::render::GetCanvas(),
					snake::render::GetSprite(snake::sprites::INCREASE),
					213 - 64,
					224
				);

				snake::render::PaintToCanvas(
					snake::render::GetCanvas(),
					snake::render::GetSprite(snake::sprites::VOLUME),
					420 - 64,
					224
				);

				// DECREASE VOLUME
				snake::render::PaintToCanvas(
					snake::render::GetCanvas(),
					snake::render::GetSprite(snake::sprites::DECREASE),
					213 - 64,
					288
				);

				snake::render::PaintToCanvas(
					snake::render::GetCanvas(),
					snake::render::GetSprite(snake::sprites::VOLUME),
					420 - 64,
					288
				);

				// RETURN
				snake::render::PaintToCanvas(
					snake::render::GetCanvas(),
					snake::render::GetSprite(snake::sprites::RETURN),
					213 - 64,
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
							128 - 64,
							224
						);
						break;
					}
					case 4: // DECREASE VOLUME
					{
						snake::render::PaintToCanvas(
							snake::render::GetCanvas(),
							snake::render::GetSprite(snake::sprites::arrow),
							128 - 64,
							288
						);
						break;
					}
					case 5: // RETURN
					{
						snake::render::PaintToCanvas(
							snake::render::GetCanvas(),
							snake::render::GetSprite(snake::sprites::arrow),
							128 - 64,
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
					213 - 64,
					32
				);

				u32 highScores[5];
				GetHighScores(highScores);

				// I
				snake::render::PaintToCanvas(
					snake::render::GetCanvas(),
					snake::render::GetSprite(snake::sprites::I),
					213 - 64,
					96
				);

				PrintScore(highScores[0], 301, 96, false);

				// II
				snake::render::PaintToCanvas(
					snake::render::GetCanvas(),
					snake::render::GetSprite(snake::sprites::II),
					213 - 64,
					160
				);

				PrintScore(highScores[1], 301, 160, false);

				// III
				snake::render::PaintToCanvas(
					snake::render::GetCanvas(),
					snake::render::GetSprite(snake::sprites::III),
					213 - 64,
					224
				);

				PrintScore(highScores[2], 301, 224, false);

				// IV
				snake::render::PaintToCanvas(
					snake::render::GetCanvas(),
					snake::render::GetSprite(snake::sprites::IV),
					213 - 64,
					288
				);

				PrintScore(highScores[3], 301, 288, false);

				// V
				snake::render::PaintToCanvas(
					snake::render::GetCanvas(),
					snake::render::GetSprite(snake::sprites::V),
					213 - 64,
					352
				);

				PrintScore(highScores[4], 301, 352, false);

				// RETURN
				snake::render::PaintToCanvas(
					snake::render::GetCanvas(),
					snake::render::GetSprite(snake::sprites::RETURN),
					213 - 64,
					416
				);


				// ARROW
				snake::render::PaintToCanvas(
					snake::render::GetCanvas(),
					snake::render::GetSprite(snake::sprites::arrow),
					128 - 64,
					416
				);

				break;
			}
			case gameplay:
			{
				snake::render::DrawBackground(snake::render::GetCanvas(), background);

				PrintTime(GetTime(), 32, 8);
				PrintScore(GetScore(), 288, 8);

				// snake head
				snake::render::Sprite* headN;
				snake::render::Sprite* headW;
				snake::render::Sprite* headS;
				snake::render::Sprite* headE;

				// going east.
				snake::render::Sprite* lEW;
				snake::render::Sprite* dEW;

				// going north
				snake::render::Sprite* lSN;
				snake::render::Sprite* dSN;

				// <from direction> <to direction>
				snake::render::Sprite* lNE;
				snake::render::Sprite* lWN;
				snake::render::Sprite* lSW;
				snake::render::Sprite* lES;

				snake::render::Sprite* dNE;
				snake::render::Sprite* dWN;
				snake::render::Sprite* dSW;
				snake::render::Sprite* dES;

				snake::render::Sprite* taillN;
				snake::render::Sprite* taillW;
				snake::render::Sprite* taillS;
				snake::render::Sprite* taillE;

				snake::render::Sprite* taildN;
				snake::render::Sprite* taildW;
				snake::render::Sprite* taildS;
				snake::render::Sprite* taildE;



				GetSnakeSprite(
					false,

					headN,
					headW,
					headS,
					headE,

					lEW,
					dEW,

					lSN,
					dSN,

					lNE,
					lWN,
					lSW,
					lES,

					dNE,
					dWN,
					dSW,
					dES,

					taillN,
					taillW,
					taillS,
					taillE,

					taildN,
					taildW,
					taildS,
					taildE
				);

				// snake head
				if(snakeComponents[0].m_init)
				{
					snake::render::Sprite* head = NULL;

					switch(snakeComponents[0].m_direction)
					{
						case North:
						{
							head = headN;
							break;
						}
						case South:
						{
							head = headS;
							break;
						}
						case East:
						{
							head = headE;
							break;
						}
						case West:
						{
							head = headW;
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
							AltDrawDirectionfulSnakeComponent(snakeComponents[index - 1].m_direction, snakeComponents[index].m_direction,
									snakeComponents[index].m_xPos, snakeComponents[index].m_yPos,
									lSN, lWN, lNE,
									lEW, lNE, lES,
									lSN, lSW, lES,
									lEW, lWN, lSW
								);
						}
						else // dark
						{
							AltDrawDirectionfulSnakeComponent(snakeComponents[index - 1].m_direction, snakeComponents[index].m_direction,
									snakeComponents[index].m_xPos, snakeComponents[index].m_yPos,
									dSN, dWN, dNE,
									dEW, dNE, dES,
									dSN, dSW, dES,
									dEW, dWN, dSW
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
								tail = taillN;
								break;
								case South:
								tail = taillS;
								break;
								case East:
								tail = taillE;
								break;
								case West:
								tail = taillW;
								default:
								break;
							}
						}
						else
						{
							switch(snakeComponents[index - 1].m_direction)
							{
								case North:
								tail = taildN;
								break;
								case South:
								tail = taildS;
								break;
								case East:
								tail = taildE;
								break;
								case West:
								tail = taildW;
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
				snake::render::Sprite* foodSprite;
				GetFoodSprite(foodSprite);

				// draw apple
				snake::render::PaintToCanvas(
					snake::render::GetCanvas(),
					foodSprite,
					GRID_START_X + appleX * FOOD_BOUNDS,
					GRID_START_Y + appleY * FOOD_BOUNDS
				);

				break;
			}

			case pre_gameover:
			{
				snake::render::DrawBackground(snake::render::GetCanvas(), background);

				PrintTime(GetTime(), 32, 8);
				PrintScore(GetScore(), 288, 8);

				// snake head
				snake::render::Sprite* headN;
				snake::render::Sprite* headW;
				snake::render::Sprite* headS;
				snake::render::Sprite* headE;

				// going east.
				snake::render::Sprite* lEW;
				snake::render::Sprite* dEW;

				// going north
				snake::render::Sprite* lSN;
				snake::render::Sprite* dSN;

				// <from direction> <to direction>
				snake::render::Sprite* lNE;
				snake::render::Sprite* lWN;
				snake::render::Sprite* lSW;
				snake::render::Sprite* lES;

				snake::render::Sprite* dNE;
				snake::render::Sprite* dWN;
				snake::render::Sprite* dSW;
				snake::render::Sprite* dES;

				snake::render::Sprite* taillN;
				snake::render::Sprite* taillW;
				snake::render::Sprite* taillS;
				snake::render::Sprite* taillE;

				snake::render::Sprite* taildN;
				snake::render::Sprite* taildW;
				snake::render::Sprite* taildS;
				snake::render::Sprite* taildE;



				GetSnakeSprite(
					false,

					headN,
					headW,
					headS,
					headE,

					lEW,
					dEW,

					lSN,
					dSN,

					lNE,
					lWN,
					lSW,
					lES,

					dNE,
					dWN,
					dSW,
					dES,

					taillN,
					taillW,
					taillS,
					taillE,

					taildN,
					taildW,
					taildS,
					taildE
				);

				snake::render::Sprite* explosion1 = snake::render::GetSprite(snake::sprites::explosion1);
				snake::render::Sprite* explosion2 = snake::render::GetSprite(snake::sprites::explosion2);
				snake::render::Sprite* explosion3 = snake::render::GetSprite(snake::sprites::explosion3);

				snake::render::Sprite* explosion1BSLess = snake::render::GetSprite(snake::sprites::explosion1bgless);
				snake::render::Sprite* explosion2BSLess = snake::render::GetSprite(snake::sprites::explosion2bgless);
				snake::render::Sprite* explosion3BSLess = snake::render::GetSprite(snake::sprites::explosion3bgless);

				switch(explosionIndex)
				{
				case 0:
				{
					snake::render::PaintToCanvas(
						snake::render::GetCanvas(),
						snake::collision::IsOutOfBounds(snakeComponents[0].m_xPos, snakeComponents[0].m_yPos, SNAKE_BOUNDS, SNAKE_BOUNDS) ? explosion1BSLess : explosion1,
						snakeComponents[0].m_xPos,
						snakeComponents[0].m_yPos
					);
					break;
				}
				case 1:
				{
					snake::render::PaintToCanvas(
						snake::render::GetCanvas(),
						snake::collision::IsOutOfBounds(snakeComponents[0].m_xPos, snakeComponents[0].m_yPos, SNAKE_BOUNDS, SNAKE_BOUNDS) ? explosion2BSLess : explosion2,
						snakeComponents[0].m_xPos,
						snakeComponents[0].m_yPos
					);
					break;
				}
				case 2:
				{
					snake::render::PaintToCanvas(
						snake::render::GetCanvas(),
						snake::collision::IsOutOfBounds(snakeComponents[0].m_xPos, snakeComponents[0].m_yPos, SNAKE_BOUNDS, SNAKE_BOUNDS) ? explosion3BSLess : explosion3,
						snakeComponents[0].m_xPos,
						snakeComponents[0].m_yPos
					);
					break;
				}
				default:
					break;
				}

				// snake body
				int index = 1;

				if(renderSnake)
				{
					while(snakeComponents[index].m_init && snakeComponents[index + 1].m_init)
					{
						if(explosionIndex - index < 0)
						{
							if((index & 1) == 0)
							{
								AltDrawDirectionfulSnakeComponent(snakeComponents[index - 1].m_direction, snakeComponents[index].m_direction,
										snakeComponents[index].m_xPos, snakeComponents[index].m_yPos,
										lSN, lWN, lNE,
										lEW, lNE, lES,
										lSN, lSW, lES,
										lEW, lWN, lSW
									);
							}
							else // dark
							{
								AltDrawDirectionfulSnakeComponent(snakeComponents[index - 1].m_direction, snakeComponents[index].m_direction,
										snakeComponents[index].m_xPos, snakeComponents[index].m_yPos,
										dSN, dWN, dNE,
										dEW, dNE, dES,
										dSN, dSW, dES,
										dEW, dWN, dSW
									);
							}
						}
						else if(explosionIndex - index == 0)
						{
							snake::render::PaintToCanvas(
								snake::render::GetCanvas(),
								explosion1,
								snakeComponents[index].m_xPos,
								snakeComponents[index].m_yPos
							);
						}
						else if(explosionIndex - index == 1)
						{
							snake::render::PaintToCanvas(
								snake::render::GetCanvas(),
								explosion2,
								snakeComponents[index].m_xPos,
								snakeComponents[index].m_yPos
							);
						}
						else if(explosionIndex - index == 2)
						{
							snake::render::PaintToCanvas(
								snake::render::GetCanvas(),
								explosion3,
								snakeComponents[index].m_xPos,
								snakeComponents[index].m_yPos
							);
						}

						++index;
					}

					if(explosionIndex - index < 0)
					{
						// snake tail
						if(snakeComponents[index].m_init)
						{
							snake::render::Sprite* tail = NULL;

							if((index & 1) == 0)
							{
								switch(snakeComponents[index - 1].m_direction)
								{
									case North:
									tail = taillN;
									break;
									case South:
									tail = taillS;
									break;
									case East:
									tail = taillE;
									break;
									case West:
									tail = taillW;
									default:
									break;
								}
							}
							else
							{
								switch(snakeComponents[index - 1].m_direction)
								{
									case North:
									tail = taildN;
									break;
									case South:
									tail = taildS;
									break;
									case East:
									tail = taildE;
									break;
									case West:
									tail = taildW;
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
					else if(explosionIndex - index == 0)
					{
						snake::render::PaintToCanvas(
							snake::render::GetCanvas(),
							explosion1,
							snakeComponents[index].m_xPos,
							snakeComponents[index].m_yPos
						);
					}
					else if(explosionIndex - index == 1)
					{
						snake::render::PaintToCanvas(
							snake::render::GetCanvas(),
							explosion2,
							snakeComponents[index].m_xPos,
							snakeComponents[index].m_yPos
						);
					}
					else if(explosionIndex - index == 2)
					{
						snake::render::PaintToCanvas(
							snake::render::GetCanvas(),
							explosion3,
							snakeComponents[index].m_xPos,
							snakeComponents[index].m_yPos
						);
					}
				}
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

				if(IsHighScore(GetScore()))
				{
					snake::render::PaintToCanvas(
						snake::render::GetCanvas(),
						snake::render::GetSprite(snake::sprites::HIGH),
						288 - 192,
						8
					);
				}
				PrintScore(GetScore(), 192, 8);

				break;
			}
			case options_menu:
			{
				snake::render::ClearCanvas(snake::render::GetCanvas());


				// Snake
				snake::render::PaintToCanvas(
					snake::render::GetCanvas(),
					snake::render::GetSprite(snake::sprites::Snake),
					149,
					96
				);

				// Roaming
				snake::render::PaintToCanvas(
					snake::render::GetCanvas(),
					snake::render::GetSprite(snake::sprites::ROAMING),
					149,
					160
				);

				if (moving_apple){
					snake::render::PaintToCanvas(
						snake::render::GetCanvas(),
						snake::render::GetSprite(snake::sprites::ON),
						500,
						160
					);
				}
				else{
					snake::render::PaintToCanvas(
						snake::render::GetCanvas(),
						snake::render::GetSprite(snake::sprites::OFF),
						500,
						160
					);
				}

				// Hard mode
				snake::render::PaintToCanvas(
					snake::render::GetCanvas(),
					snake::render::GetSprite(snake::sprites::HARDMODE),
					149,
					224
				);

				if (hardMode){
					snake::render::PaintToCanvas(
						snake::render::GetCanvas(),
						snake::render::GetSprite(snake::sprites::ON),
						500,
						224
					);
				}
				else{
					snake::render::PaintToCanvas(
						snake::render::GetCanvas(),
						snake::render::GetSprite(snake::sprites::OFF),
						500,
						224
					);
				}

				// Snake color
				snake::render::PaintToCanvas(
					snake::render::GetCanvas(),
					snake::render::GetSprite(snake::sprites::SNAKECOLOUR),
					149,
					288
				);


				snake::render::Sprite* headN;
				snake::render::Sprite* headW;
				snake::render::Sprite* headS;
				snake::render::Sprite* headE;

				snake::render::Sprite* lEW;
				snake::render::Sprite* dEW;

				snake::render::Sprite* lSN;
				snake::render::Sprite* dSN;

				snake::render::Sprite* lNE;
				snake::render::Sprite* lWN;
				snake::render::Sprite* lSW;
				snake::render::Sprite* lES;

				snake::render::Sprite* dNE;
				snake::render::Sprite* dWN;
				snake::render::Sprite* dSW;
				snake::render::Sprite* dES;

				snake::render::Sprite* taillN;
				snake::render::Sprite* taillW;
				snake::render::Sprite* taillS;
				snake::render::Sprite* taillE;

				snake::render::Sprite* taildN;
				snake::render::Sprite* taildW;
				snake::render::Sprite* taildS;
				snake::render::Sprite* taildE;

				snake::GetSnakeSprite(
					false,

					headN,
					headW,
					headS,
					headE,

					lEW,
					dEW,

					lSN,
					dSN,

					lNE,
					lWN,
					lSW,
					lES,

					dNE,
					dWN,
					dSW,
					dES,

					taillN,
					taillW,
					taillS,
					taillE,

					taildN,
					taildW,
					taildS,
					taildE
				);

				snake::render::PaintToCanvas(
					snake::render::GetCanvas(),
					headW,
					468,
					288
				);

				snake::render::PaintToCanvas(
					snake::render::GetCanvas(),
					dEW,
					500,
					288
				);

				snake::render::PaintToCanvas(
					snake::render::GetCanvas(),
					taillW,
					532,
					288
				);


				// Food Sprites
				snake::render::PaintToCanvas(
					snake::render::GetCanvas(),
					snake::render::GetSprite(snake::sprites::FOOD),
					149,
					352
				);

				snake::render::Sprite* foodSprite;
				snake::GetFoodSprite(foodSprite);

				snake::render::PaintToCanvas(
					snake::render::GetCanvas(),
					foodSprite,
					500,
					352
				);

				// Return
				snake::render::PaintToCanvas(
					snake::render::GetCanvas(),
					snake::render::GetSprite(snake::sprites::RETURN),
					149,
					416
				);

				// ARROW
				switch(cursorPosition)
				{
					case 7: // ADJUST VOLUME
					{
						snake::render::PaintToCanvas(
							snake::render::GetCanvas(),
							snake::render::GetSprite(snake::sprites::arrow),
							64,
							160
						);
						break;
					}
					case 8: // HIGHSCORE
					{
						snake::render::PaintToCanvas(
							snake::render::GetCanvas(),
							snake::render::GetSprite(snake::sprites::arrow),
							64,
							224
						);
						break;
					}
					case 9: // PLAY GAME
					{
						snake::render::PaintToCanvas(
							snake::render::GetCanvas(),
							snake::render::GetSprite(snake::sprites::arrow),
							64,
							288
						);
						break;
					}
					case 10: //OPTIONS
					{
						snake::render::PaintToCanvas(
							snake::render::GetCanvas(),
							snake::render::GetSprite(snake::sprites::arrow),
							64,
							352
						);
						break;
					}
					case 5: //OPTIONS
					{
						snake::render::PaintToCanvas(
							snake::render::GetCanvas(),
							snake::render::GetSprite(snake::sprites::arrow),
							64,
							416
						);
						break;
					}
					default:
					{
						break;
					}
				}
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

	void AltRender(SnakeDirection direction, bool showHead, bool renderSnake, bool highScore)
	{
		snake::render::DrawBackground(snake::render::GetCanvas(), background);

		PrintTime(GetTime(), 32, 8);
		PrintScore(GetScore(), 288, 8);

		// snake head
		snake::render::Sprite* headN;
		snake::render::Sprite* headW;
		snake::render::Sprite* headS;
		snake::render::Sprite* headE;

		// going east.
		snake::render::Sprite* lEW;
		snake::render::Sprite* dEW;

		// going north
		snake::render::Sprite* lSN;
		snake::render::Sprite* dSN;

		// <from direction> <to direction>
		snake::render::Sprite* lNE;
		snake::render::Sprite* lWN;
		snake::render::Sprite* lSW;
		snake::render::Sprite* lES;

		snake::render::Sprite* dNE;
		snake::render::Sprite* dWN;
		snake::render::Sprite* dSW;
		snake::render::Sprite* dES;

		snake::render::Sprite* taillN;
		snake::render::Sprite* taillW;
		snake::render::Sprite* taillS;
		snake::render::Sprite* taillE;

		snake::render::Sprite* taildN;
		snake::render::Sprite* taildW;
		snake::render::Sprite* taildS;
		snake::render::Sprite* taildE;



		GetSnakeSprite(
			true,

			headN,
			headW,
			headS,
			headE,

			lEW,
			dEW,

			lSN,
			dSN,

			lNE,
			lWN,
			lSW,
			lES,

			dNE,
			dWN,
			dSW,
			dES,

			taillN,
			taillW,
			taillS,
			taillE,

			taildN,
			taildW,
			taildS,
			taildE
		);


		if(!snakeComponents[1].m_init)
		{
			snake::render::Sprite* tail = NULL;
			switch(direction)
			{
				case North:
				tail = taillN;
				break;
				case South:
				tail = taillS;
				break;
				case East:
				tail = taillE;
				break;
				case West:
				tail = taillW;
				default:
				break;
			}

			snake::render::PaintToCanvas(
				snake::render::GetCanvas(),
				tail,
				snakeComponents[0].m_xPos,
				snakeComponents[0].m_yPos
			);
		}
		else
		{
			AltDrawDirectionfulSnakeComponent(direction, snakeComponents[0].m_direction,
				snakeComponents[0].m_xPos, snakeComponents[0].m_yPos,
				dSN, dWN, lNE,
				dEW, dNE, lES,
				lSN, lSW, dES,
				lEW, lWN, dSW
			);
		}

		// snake body
		int index = 1;

		if(renderSnake)
		{
			while(snakeComponents[index].m_init && snakeComponents[index + 1].m_init)
			{
				if((index & 1) == 0) // light
				{
					AltDrawDirectionfulSnakeComponent(snakeComponents[index - 1].m_direction, snakeComponents[index].m_direction,
							snakeComponents[index].m_xPos, snakeComponents[index].m_yPos,
							dSN, dWN, lNE,
							dEW, dNE, lES,
							lSN, lSW, dES,
							lEW, lWN, dSW
						);
				}
				else // dark
				{
					AltDrawDirectionfulSnakeComponent(snakeComponents[index - 1].m_direction, snakeComponents[index].m_direction,
							snakeComponents[index].m_xPos, snakeComponents[index].m_yPos,
							lSN, lWN, dNE,
							lEW, lNE, dES,
							dSN, dSW, lES,
							dEW, dWN, lSW
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
						tail = taillN;
						break;
						case South:
						tail = taillS;
						break;
						case East:
						tail = taillE;
						break;
						case West:
						tail = taillW;
						default:
						break;
					}
				}
				else
				{
					switch(snakeComponents[index - 1].m_direction)
					{
						case North:
						tail = taildN;
						break;
						case South:
						tail = taildS;
						break;
						case East:
						tail = taildE;
						break;
						case West:
						tail = taildW;
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

		snake::render::Sprite* foodSprite;
		GetFoodSprite(foodSprite);

		// draw apple
		snake::render::PaintToCanvas(
			snake::render::GetCanvas(),
			foodSprite,
			GRID_START_X + appleX * FOOD_BOUNDS,
			GRID_START_Y + appleY * FOOD_BOUNDS
		);

		if(snakeComponents[0].m_init)
		{
			snake::render::Sprite* head = NULL;

			s32 xPos = snakeComponents[0].m_xPos;
			s32 yPos = snakeComponents[0].m_yPos;

			snake::render::Sprite* headNBGLess = NULL;
			snake::render::Sprite* headWBGLess = NULL;
			snake::render::Sprite* headEBGLess = NULL;
			snake::render::Sprite* headSBGLess = NULL;

			switch(snakeColor)
			{
			case blue:
			{
				headNBGLess = snake::render::GetSprite(snake::sprites::headN2bbgless);
				headWBGLess = snake::render::GetSprite(snake::sprites::headW2bbgless);
				headEBGLess = snake::render::GetSprite(snake::sprites::headE2bbgless);
				headSBGLess = snake::render::GetSprite(snake::sprites::headS2bbgless);
				break;
			}
			case red:
			{
				headNBGLess = snake::render::GetSprite(snake::sprites::headN2rbgless);
				headWBGLess = snake::render::GetSprite(snake::sprites::headW2rbgless);
				headEBGLess = snake::render::GetSprite(snake::sprites::headE2rbgless);
				headSBGLess = snake::render::GetSprite(snake::sprites::headS2rbgless);
				break;
			}
			case green:
			default:
			{
				headNBGLess = snake::render::GetSprite(snake::sprites::headN2bgless);
				headWBGLess = snake::render::GetSprite(snake::sprites::headW2bgless);
				headEBGLess = snake::render::GetSprite(snake::sprites::headE2bgless);
				headSBGLess = snake::render::GetSprite(snake::sprites::headS2bgless);
				break;
			}

			}

			switch(direction)
			{

				case North:
				{
					head = snake::collision::IsOutOfBounds(
							xPos,
							yPos - snake::sprites::SpriteWidths[snake::sprites::headN2] / 2,
							snake::sprites::SpriteWidths[snake::sprites::headN2],
							snake::sprites::SpriteHeights[snake::sprites::headN2]) ?  headNBGLess : headN;

					yPos -= snake::sprites::SpriteWidths[snake::sprites::headN2] / 2;
					break;
				}
				case South:
				{
					head = snake::collision::IsOutOfBounds(
							xPos,
							yPos + snake::sprites::SpriteWidths[snake::sprites::headS2] / 2,
							snake::sprites::SpriteWidths[snake::sprites::headS2],
							snake::sprites::SpriteHeights[snake::sprites::headS2]) ?  headSBGLess : headS;
					yPos += snake::sprites::SpriteWidths[snake::sprites::headS2];
					break;
				}
				case East:
				{
					head = snake::collision::IsOutOfBounds(
							xPos + 2 * snake::sprites::SpriteWidths[snake::sprites::headE2],
							yPos,
							snake::sprites::SpriteWidths[snake::sprites::headE2],
							snake::sprites::SpriteHeights[snake::sprites::headE2]) ?  headEBGLess : headE;
					xPos += 2 * snake::sprites::SpriteWidths[snake::sprites::headE2];
					break;
				}
				case West:
				{
					head = snake::collision::IsOutOfBounds(
							xPos - snake::sprites::SpriteWidths[snake::sprites::headW2],
							yPos,
							snake::sprites::SpriteWidths[snake::sprites::headW2],
							snake::sprites::SpriteHeights[snake::sprites::headW2]) ?  headWBGLess : headW;
					xPos -= snake::sprites::SpriteWidths[snake::sprites::headW2];
					break;
				}
			}

			assert(head);

			if(showHead)
			{
				snake::render::PaintToCanvas(
					snake::render::GetCanvas(),
					head,
					xPos,
					yPos
				);
			}
		}

		snake::render::Draw();
		snake::render::Draw();
		snake::render::Draw();
		snake::render::Draw();
	}

	void AltDrawDirectionfulSnakeComponent(
			SnakeDirection thisDirection,
			SnakeDirection nextDirection,
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
		)
	{
		snake::render::Sprite* drawingSprite = NULL;

		if(thisDirection == North)
		{
			if(nextDirection == North || nextDirection == South)
			{
				drawingSprite = sn;
			}
			else if(nextDirection == West)
			{
				drawingSprite = en;
			}
			else if(nextDirection == East)
			{
				drawingSprite = wn;
			}
		}
		else if (thisDirection == South)
		{
			if(nextDirection == North || nextDirection == South)
			{
				drawingSprite = ns;
			}
			else if(nextDirection == West)
			{
				drawingSprite = es;
			}
			else if(nextDirection == East)
			{
				drawingSprite = ws;
			}
		}
		else if (thisDirection == West)
		{
			if(nextDirection == East || nextDirection == West)
			{
				drawingSprite = ew;
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
		else // East
		{
			if(nextDirection == East || nextDirection == West)
			{
				drawingSprite = we;
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
		// xil_printf("Snake moved forward one unit\r\n");

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

	//void toggle_pause(){
	//	paused = paused ^ 0x1;
	//}

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

	bool IsHighScore(u32 score)
	{
		return score >= highScores[0];
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

	void PrintScore(u32 score, u32 xPos, u32 yPos, bool showScoreWord)
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

		if(showScoreWord)
		{
			snake::render::PaintToCanvas(
				snake::render::GetCanvas(),
				snake::render::GetSprite(snake::sprites::SCORE),
				xPos,
				yPos
			);

			xPos += snake::sprites::SpriteWidths[snake::sprites::SCORE];
		}

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

	bool GetHardMode()
	{
		return hardMode;
	}

	u64 GetTimeOut(u64 baseTimeOut)
	{
		if(!hardMode)
		{
			return baseTimeOut;
		}

		u32 score = GetScore();

		if(score < 100)
		{
			return baseTimeOut;
		}
		if(score < 1000)
		{
			return baseTimeOut / 2;
		}
		if(score < 10000)
		{
			return baseTimeOut / 4;
		}
		if(score < 100000)
		{
			return baseTimeOut / 8;
		}

		// stub. will have altered time in hard mode.
		return baseTimeOut;
	}

	void SetSnakeColor(SnakeColor newColor)
	{
		snakeColor = newColor;
	}

	SnakeColor GetSnakeColor()
	{
		return snakeColor;
	}

	void SetFoodSprite(FoodSprite newFood)
	{
		foodSprite = newFood;
	}

	FoodSprite GetFoodSprite()
	{
		return foodSprite;
	}

	void GetFoodSprite(snake::render::Sprite*& outSprite)
	{
		switch(foodSprite)
		{
			case orange:
			{
				outSprite = snake::render::GetSprite(snake::sprites::orange);
				break;
			}
			case cherry:
			{
				outSprite = snake::render::GetSprite(snake::sprites::cherry);
				break;
			}
			case meat:
			{
				outSprite = snake::render::GetSprite(snake::sprites::meat);
				break;
			}
			case cheese:
			{
				outSprite = snake::render::GetSprite(snake::sprites::cheese);
				break;
			}
			case apple:
			default:
			{
				outSprite = snake::render::GetSprite(snake::sprites::apple);
				break;
			}
		}
	}

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
		)
	{
		using namespace snake::sprites;
		using namespace snake::render;

		if(isOffFrame)
		{
			headN = snakeColor == green ? GetSprite(headN2) : snakeColor == red ? GetSprite(headN2r) : GetSprite(headN2b);
			headW = snakeColor == green ? GetSprite(headW2) : snakeColor == red ? GetSprite(headW2r) : GetSprite(headW2b);
			headS = snakeColor == green ? GetSprite(headS2) : snakeColor == red ? GetSprite(headS2r) : GetSprite(headS2b);
			headE = snakeColor == green ? GetSprite(headE2) : snakeColor == red ? GetSprite(headE2r) : GetSprite(headE2b);

			lEW = snakeColor == green ? GetSprite(bodyDarkH2) : snakeColor == red ? GetSprite(bodyDarkH2r) : GetSprite(bodyDarkH2b);
			dEW = snakeColor == green ? GetSprite(bodyLightH2) : snakeColor == red ? GetSprite(bodyLightH2r) : GetSprite(bodyLightH2b);

			lSN = snakeColor == green ? GetSprite(bodyLightV2) : snakeColor == red ? GetSprite(bodyLightV2r) : GetSprite(bodyLightV2b);
			dSN = snakeColor == green ? GetSprite(bodyDarkV2) : snakeColor == red ? GetSprite(bodyDarkV2r) : GetSprite(bodyDarkV2b);
			
			lNE = snakeColor == green ? GetSprite(bodyLightNE2) : snakeColor == red ? GetSprite(bodyLightNE2r) : GetSprite(bodyLightNE2b);
			lWN = snakeColor == green ? GetSprite(bodyDarkNE2)  : snakeColor == red ? GetSprite(bodyDarkNE2r)  : GetSprite(bodyDarkNE2b);
			lSW = snakeColor == green ? GetSprite(bodyLightSW2) : snakeColor == red ? GetSprite(bodyLightSW2r) : GetSprite(bodyLightSW2b);
			lES = snakeColor == green ? GetSprite(bodyDarkSW2) : snakeColor == red ? GetSprite(bodyDarkSW2r) : GetSprite(bodyDarkSW2b);
			
			dNE = snakeColor == green ? GetSprite(bodyDarkNW2)  : snakeColor == red ? GetSprite(bodyDarkNW2r)  : GetSprite(bodyDarkNW2b);
			dWN = snakeColor == green ? GetSprite(bodyLightNW2) : snakeColor == red ? GetSprite(bodyLightNW2r) : GetSprite(bodyLightNW2b);
			dSW = snakeColor == green ? GetSprite(bodyDarkSE2)  : snakeColor == red ? GetSprite(bodyDarkSE2r)  : GetSprite(bodyDarkSE2b);
			dES = snakeColor == green ? GetSprite(bodyLightSE2)  : snakeColor == red ? GetSprite(bodyLightSE2r)  : GetSprite(bodyLightSE2b);
		
			taillN = snakeColor == green ? GetSprite(tailLightN2) : snakeColor == red ? GetSprite(tailLightN2r) : GetSprite(tailLightN2b);
			taillW = snakeColor == green ? GetSprite(tailLightW2) : snakeColor == red ? GetSprite(tailLightW2r) : GetSprite(tailLightW2b);
			taillS = snakeColor == green ? GetSprite(tailLightS2) : snakeColor == red ? GetSprite(tailLightS2r) : GetSprite(tailLightS2b);
			taillE = snakeColor == green ? GetSprite(tailLightE2) : snakeColor == red ? GetSprite(tailLightE2r) : GetSprite(tailLightE2b);
			
			taildN = snakeColor == green ? GetSprite(tailDarkN2) : snakeColor == red ? GetSprite(tailDarkN2r) : GetSprite(tailDarkN2b);
			taildW = snakeColor == green ? GetSprite(tailDarkW2) : snakeColor == red ? GetSprite(tailDarkW2r) : GetSprite(tailDarkW2b);
			taildS = snakeColor == green ? GetSprite(tailDarkS2) : snakeColor == red ? GetSprite(tailDarkS2r) : GetSprite(tailDarkS2b);
			taildE = snakeColor == green ? GetSprite(tailDarkE2) : snakeColor == red ? GetSprite(tailDarkE2r) : GetSprite(tailDarkE2b);
		}
		else
		{
			headN = snakeColor == green ? GetSprite(headN1) : snakeColor == red ? GetSprite(headN1r) : GetSprite(headN1b);
			headW = snakeColor == green ? GetSprite(headW1) : snakeColor == red ? GetSprite(headW1r) : GetSprite(headW1b);
			headS = snakeColor == green ? GetSprite(headS1) : snakeColor == red ? GetSprite(headS1r) : GetSprite(headS1b);
			headE = snakeColor == green ? GetSprite(headE1) : snakeColor == red ? GetSprite(headE1r) : GetSprite(headE1b);

			lEW = snakeColor == green ? GetSprite(bodyLightH1) : snakeColor == red ? GetSprite(bodyLightH1r) : GetSprite(bodyLightH1b);
			dEW = snakeColor == green ? GetSprite(bodyDarkH1) : snakeColor == red ? GetSprite(bodyDarkH1r) : GetSprite(bodyDarkH1b);

			lSN = snakeColor == green ? GetSprite(bodyLightV1) : snakeColor == red ? GetSprite(bodyLightV1r) : GetSprite(bodyLightV1b);
			dSN = snakeColor == green ? GetSprite(bodyDarkV1) : snakeColor == red ? GetSprite(bodyDarkV1r) : GetSprite(bodyDarkV1b);
			
			lNE = snakeColor == green ? GetSprite(bodyLightNE1) : snakeColor == red ? GetSprite(bodyLightNE1r) : GetSprite(bodyLightNE1b);
			lWN = snakeColor == green ? GetSprite(bodyLightNW1)  : snakeColor == red ? GetSprite(bodyLightNW1r)  : GetSprite(bodyLightNW1b);
			lSW = snakeColor == green ? GetSprite(bodyLightSW1) : snakeColor == red ? GetSprite(bodyLightSW1r) : GetSprite(bodyLightSW1b);
			lES = snakeColor == green ? GetSprite(bodyLightSE1) : snakeColor == red ? GetSprite(bodyLightSE1r) : GetSprite(bodyLightSE1b);
			
			dNE = snakeColor == green ? GetSprite(bodyDarkNE1) : snakeColor == red ? GetSprite(bodyDarkNE1r) : GetSprite(bodyDarkNE1b);
			dWN = snakeColor == green ? GetSprite(bodyDarkNW1) : snakeColor == red ? GetSprite(bodyDarkNW1r) : GetSprite(bodyDarkNW1b);
			dSW = snakeColor == green ? GetSprite(bodyDarkSW1) : snakeColor == red ? GetSprite(bodyDarkSW1r) : GetSprite(bodyDarkSW1b);
			dES = snakeColor == green ? GetSprite(bodyDarkSE1) : snakeColor == red ? GetSprite(bodyDarkSE1r) : GetSprite(bodyDarkSE1b);
		
			taillN = snakeColor == green ? GetSprite(tailLightN1) : snakeColor == red ? GetSprite(tailLightN1r) : GetSprite(tailLightN1b);
			taillW = snakeColor == green ? GetSprite(tailLightW1) : snakeColor == red ? GetSprite(tailLightW1r) : GetSprite(tailLightW1b);
			taillS = snakeColor == green ? GetSprite(tailLightS1) : snakeColor == red ? GetSprite(tailLightS1r) : GetSprite(tailLightS1b);
			taillE = snakeColor == green ? GetSprite(tailLightE1) : snakeColor == red ? GetSprite(tailLightE1r) : GetSprite(tailLightE1b);
			
			taildN = snakeColor == green ? GetSprite(tailDarkN1) : snakeColor == red ? GetSprite(tailDarkN1r) : GetSprite(tailDarkN1b);
			taildW = snakeColor == green ? GetSprite(tailDarkW1) : snakeColor == red ? GetSprite(tailDarkW1r) : GetSprite(tailDarkW1b);
			taildS = snakeColor == green ? GetSprite(tailDarkS1) : snakeColor == red ? GetSprite(tailDarkS1r) : GetSprite(tailDarkS1b);
			taildE = snakeColor == green ? GetSprite(tailDarkE1) : snakeColor == red ? GetSprite(tailDarkE1r) : GetSprite(tailDarkE1b);
		}
	}


}
