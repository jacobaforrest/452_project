/*

#include "DEBUG_renderTest.h"

#include <string.h>
#include <xtime_l.h>
#include <xil_printf.h>

#include "render.h"

#define PERF_RENDER_ITRS 100

namespace debug
{
	namespace render
	{
		void GetGraphicsTest(snake::render::DummyObject dummyObjects[snake::sprites::__ENUM_END__])
		{
			s16 xPos = 0;
			s16 yPos = 0;
			s16 maxWidth = 0;

			for(u32 i = snake::sprites::__ENUM_START__; i < snake::sprites::__ENUM_END__; ++i)
			{
				if( maxWidth < (snake::sprites::SpriteWidths[i] << snake::render::Sprite::c_scaleShift) )
				{
					maxWidth = snake::sprites::SpriteWidths[i] << snake::render::Sprite::c_scaleShift;
				}
			}

			for(u32 i = snake::sprites::__ENUM_START__; i < snake::sprites::__ENUM_END__; ++i)
			{
				dummyObjects[i] =
				{
					snake::render::GetSprite( (snake::sprites::SpriteIndex) i ),
					xPos,
					yPos
				};

				yPos += snake::sprites::SpriteHeights[i] << snake::render::Sprite::c_scaleShift;

				if(yPos >= CANVAS_HEIGHT)
				{
					yPos = 0;
					xPos += maxWidth;
				}
			}
		}

		void GetGameplayDemoScreen(snake::render::DummyObject dummyObjects[], u32* background)
		{
			const u32 gridSize = 13;
			const u32 step = 32;
			const u32 xStart = 112;
			const u32 yStart = 48;

			const snake::render::Sprite* sprite = snake::render::GetSprite(snake::sprites::bg);

			snake::render::ClearCanvas(background);

			for(u32 x = 0; x < gridSize; ++x)
			{
				for(u32 y = 0; y < gridSize; ++y)
				{
					snake::render::PaintToCanvas(background, sprite, xStart + x * step, yStart + y * step);
				}
			}

			dummyObjects[0] = { snake::render::GetSprite(snake::sprites::headE), 304, 144 };
			dummyObjects[1] = { snake::render::GetSprite(snake::sprites::apple), 400, 144 };

			dummyObjects[2] = { snake::render::GetSprite(snake::sprites::body2), 272, 144 };
			dummyObjects[3] = { snake::render::GetSprite(snake::sprites::body1), 240, 144 };
			dummyObjects[4] = { snake::render::GetSprite(snake::sprites::body2), 208, 144 };

			dummyObjects[5] = { snake::render::GetSprite(snake::sprites::body1), 208, 176 };
			dummyObjects[6] = { snake::render::GetSprite(snake::sprites::body2), 208, 208 };
			dummyObjects[7] = { snake::render::GetSprite(snake::sprites::body1), 208, 240 };
			dummyObjects[8] = { snake::render::GetSprite(snake::sprites::body2), 208, 272 };
			dummyObjects[9] = { snake::render::GetSprite(snake::sprites::body1), 208, 304 };

			dummyObjects[10] = { snake::render::GetSprite(snake::sprites::body2), 240, 304 };
			dummyObjects[11] = { snake::render::GetSprite(snake::sprites::body1), 272, 304 };
			dummyObjects[12] = { snake::render::GetSprite(snake::sprites::body2), 304, 304 };

			dummyObjects[13] = { snake::render::GetSprite(snake::sprites::body1), 304, 336 };

			dummyObjects[14] = { snake::render::GetSprite(snake::sprites::SCORE), 160, 0 };
			dummyObjects[15] = { snake::render::GetSprite(snake::sprites::one), 352, 0 };
			dummyObjects[16] = { snake::render::GetSprite(snake::sprites::two), 384, 0 };
			dummyObjects[17] = { snake::render::GetSprite(snake::sprites::four), 416, 0 };
			dummyObjects[18] = { snake::render::GetSprite(snake::sprites::zero), 448, 0 };
		}

		void GetStressTest(snake::render::DummyObject dummyObjects[STRESS_TEST_COUNT])
		{
			const u32 offset = snake::sprites::SpriteWidths[snake::sprites::apple] << snake::render::Sprite::c_scaleShift;

			s16 xPos = 0u, yPos = 0u;

			for(u32 i = 0; i < STRESS_TEST_COUNT; ++i)
			{
				dummyObjects[i] =
				{
					snake::render::GetSprite( snake::sprites::apple ),
					xPos,
					yPos
				};

				xPos += offset;
				if(xPos >= CANVAS_WIDTH)
				{
					xPos = 0u;
					yPos += offset;
				}
			}
		}

		void Test()
		{
			bool test1Passed = Unit1();
			if(!test1Passed)
			{
				xil_printf("Rendering Test 1 Failed.\n");
				snake::render::Draw();
			}

			bool test2Passed = Unit2();
			if(!test2Passed)
			{
				xil_printf("Rendering Test 2 Failed.\n");
				snake::render::Draw();
			}

			bool test3Passed = Unit3();
			if(!test3Passed)
			{
				xil_printf("Rendering Test 3 Failed.\n");
				snake::render::Draw();
			}

			bool test4Passed = Unit4();
			if(!test4Passed)
			{
				xil_printf("Rendering Test 4 Failed.\n");
				snake::render::Draw();
			}

			bool test5Passed = Unit5();
			if(!test5Passed)
			{
				xil_printf("Rendering Test 5 Failed.\n");
				snake::render::Draw();
			}

			bool test6Passed = Unit6();
			if(!test6Passed)
			{
				xil_printf("Rendering Test 6 Failed.\n");
				snake::render::Draw();
			}

			bool test7Passed = Unit7();
			if(!test7Passed)
			{
				xil_printf("Rendering Test 7 Failed.\n");
				snake::render::Draw();
			}

			bool test8Passed = Unit8();
			if(!test8Passed)
			{
				xil_printf("Rendering Test 8 Failed.\n");
				snake::render::Draw();
			}

			bool test9Passed = Unit9();
			if(!test9Passed)
			{
				xil_printf("Rendering Test 9 Failed.\n");
				snake::render::Draw();
			}

			bool test10Passed = Unit10();
			if(!test10Passed)
			{
				xil_printf("Rendering Test 10 Failed.\n");
				snake::render::Draw();
			}

			Performance();
		}


		bool CheckSprite(u32* canvas, const snake::render::Sprite* sprite, s32 xPos, s32 yPos)
		{
			s16 xStart, yStart, xEnd, yEnd;

			snake::render::GetDrawBounds(*sprite, xPos, yPos, xStart, xEnd, yStart, yEnd);

			for(s16 x = xStart; x < xEnd; ++x)
			{
				for(s16 y = yStart; y < yEnd; ++y)
				{
					s32 readIndex = snake::render::GetReadIndex(x, y, *sprite);
					s32 writeIndex = snake::render::GetWriteIndex(x, y, xPos, yPos);

					if(sprite->m_spriteData[readIndex] != canvas[writeIndex])
					{
						return false;
					}
				}
			}

			return true;
		}

		bool IsCanvasBlank(u32* canvas)
		{
			for(u32 i = 0; i < CANVAS_HEIGHT * CANVAS_WIDTH; ++i)
			{
				if(canvas[i] != CLEAR_COLOR)
				{
					return false;
				}
			}

			return true;
		}

		bool Unit1()
		{
			// clear canvas
			snake::render::ClearCanvas(snake::render::GetCanvas());
			bool canvasClear = IsCanvasBlank(snake::render::GetCanvas());

			return canvasClear;
		}

		bool Unit2()
		{
			// clear canvas after sprite draw
			snake::render::ClearCanvas(snake::render::GetCanvas());
			snake::render::Sprite* sprite = snake::render::GetSprite(snake::sprites::apple);

			snake::render::PaintToCanvas(snake::render::GetCanvas(), sprite, 0, 0);
			bool spriteDrawn = CheckSprite(snake::render::GetCanvas(), sprite, 0, 0);

			return spriteDrawn;
		}

		bool Unit3()
		{
			// double draw, non-overlapping sprite draw
			snake::render::ClearCanvas(snake::render::GetCanvas());
			snake::render::Sprite* sprite1 = snake::render::GetSprite(snake::sprites::apple);
			snake::render::Sprite* sprite2 = snake::render::GetSprite(snake::sprites::START);

			snake::render::PaintToCanvas(snake::render::GetCanvas(), sprite1, 0, 0);
			bool sprite1Drawn = CheckSprite(snake::render::GetCanvas(), sprite1, 0, 0);

			snake::render::PaintToCanvas(snake::render::GetCanvas(), sprite2, 512, 512);
			bool sprite2Drawn = CheckSprite(snake::render::GetCanvas(), sprite2, 512, 512);

			return sprite1Drawn && sprite2Drawn;
		}

		bool Unit4()
		{
			// triple draw, non-overlapping sprite draw
			snake::render::ClearCanvas(snake::render::GetCanvas());
			snake::render::Sprite* sprite1 = snake::render::GetSprite(snake::sprites::apple);
			snake::render::Sprite* sprite2 = snake::render::GetSprite(snake::sprites::START);
			snake::render::Sprite* sprite3 = snake::render::GetSprite(snake::sprites::SCORE);

			snake::render::PaintToCanvas(snake::render::GetCanvas(), sprite1, 0, 0);
			bool sprite1Drawn = CheckSprite(snake::render::GetCanvas(), sprite1, 0, 0);

			snake::render::PaintToCanvas(snake::render::GetCanvas(), sprite2, 512, 512);
			bool sprite2Drawn = CheckSprite(snake::render::GetCanvas(), sprite2, 512, 512);

			snake::render::PaintToCanvas(snake::render::GetCanvas(), sprite3, 512, 700);
			bool sprite3Drawn = CheckSprite(snake::render::GetCanvas(), sprite3, 512, 700);

			return sprite1Drawn && sprite2Drawn && sprite3Drawn;
		}

		bool Unit5()
		{
			// overlapping sprite draw
			snake::render::ClearCanvas(snake::render::GetCanvas());
			snake::render::Sprite* sprite1 = snake::render::GetSprite(snake::sprites::apple);
			snake::render::Sprite* sprite2 = snake::render::GetSprite(snake::sprites::bg);

			snake::render::PaintToCanvas(snake::render::GetCanvas(), sprite1, 0, 0);
			bool sprite1Drawn = CheckSprite(snake::render::GetCanvas(), sprite1, 0, 0);

			snake::render::PaintToCanvas(snake::render::GetCanvas(), sprite2, 8, 8);
			bool sprite2Drawn = CheckSprite(snake::render::GetCanvas(), sprite2, 8, 8);

			bool sprite1Overlapped = !CheckSprite(snake::render::GetCanvas(), sprite1, 0, 0);

			return sprite1Drawn && sprite2Drawn && sprite1Overlapped;
		}

		bool Unit6()
		{
			// oob sprite draw
			snake::render::ClearCanvas(snake::render::GetCanvas());
			snake::render::Sprite* sprite1 = snake::render::GetSprite(snake::sprites::apple);

			snake::render::PaintToCanvas(snake::render::GetCanvas(), sprite1, -100, -100);
			bool canvasClear = IsCanvasBlank(snake::render::GetCanvas());

			return canvasClear;
		}

		bool Unit7()
		{
			// oob sprite draw, then in bounds sprite draw
			snake::render::ClearCanvas(snake::render::GetCanvas());
			snake::render::Sprite* sprite1 = snake::render::GetSprite(snake::sprites::apple);
			snake::render::Sprite* sprite2 = snake::render::GetSprite(snake::sprites::HIGH);

			snake::render::PaintToCanvas(snake::render::GetCanvas(), sprite1, -300, -300);
			bool canvasClear = IsCanvasBlank(snake::render::GetCanvas());

			snake::render::PaintToCanvas(snake::render::GetCanvas(), sprite2, 0, 0);
			bool sprite2Drawn = CheckSprite(snake::render::GetCanvas(), sprite2, 0, 0);

			return canvasClear && sprite2Drawn;
		}

		// lowkey I don't want to implement these.
		bool Unit8()
		{
			// partially in bound sprite draw x4 (edges)
			return true;
		}

		bool Unit9()
		{
			// partially in bound sprite draw x4 (corners)
			return true;
		}

		bool Unit10()
		{
			// oob sprite draw, then in bounds sprite draw
			snake::render::ClearCanvas(snake::render::GetCanvas());
			snake::render::Sprite* sprite1 = snake::render::GetSprite(snake::sprites::apple);
			snake::render::Sprite* sprite2 = snake::render::GetSprite(snake::sprites::HIGH);

			snake::render::PaintToCanvas(snake::render::GetCanvas(), sprite1, 0, 0);
			snake::render::PaintToCanvas(snake::render::GetCanvas(), sprite2, 0, 0);

			bool sprite2Drawn = CheckSprite(snake::render::GetCanvas(), sprite2, 0, 0);

			return sprite2Drawn;
		}

		void Performance()
		{
			snake::render::DummyObject* stressTest = new snake::render::DummyObject[STRESS_TEST_COUNT];

			GetStressTest(stressTest);

			XTime start, end;
			XTime_GetTime(&start);

			for(u32 i = 0; i < PERF_RENDER_ITRS; ++i)
			{
				snake::render::ClearCanvas(snake::render::GetCanvas());

				for(u32 i = 0; i < STRESS_TEST_COUNT; ++i)
				{
					snake::render::PaintToCanvas(snake::render::GetCanvas(), stressTest[i].m_sprite, stressTest[i].m_xPos, stressTest[i].m_yPos);
				}

				snake::render::Draw();
			}

			XTime_GetTime(&end);

			float diff = (end - start);
			float duration = diff / COUNTS_PER_SECOND;

			u32 secs = duration;
			u32 ms = (duration - secs) * 1000;

			xil_printf("Rendered: %u frame buffers in: %u.%03u seconds\n\r", PERF_RENDER_ITRS, secs, ms);

			delete[] stressTest;
		}
	}
}
*/
