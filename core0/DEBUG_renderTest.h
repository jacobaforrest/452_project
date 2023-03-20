/*
#ifndef DEBUG_RENDERTEST_H
#define DEBUG_RENDERTEST_H

#include "xil_types.h"
#include "sprites.h"

#define STRESS_TEST_COUNT 300

namespace snake
{
	namespace render
	{
		class Sprite;
		class DummyObject;
	}
}

namespace debug
{
	namespace render
	{
		void Test();

		void GetGraphicsTest(snake::render::DummyObject dummyObjects[snake::sprites::__ENUM_END__]);
		void GetGameplayDemoScreen(snake::render::DummyObject dummyObjects[], u32* background);
		void GetStressTest(snake::render::DummyObject dummyObjects[STRESS_TEST_COUNT]); // max number of non-overlapping sprites that can be on screen

		bool CheckSprite(u32* canvas, const snake::render::Sprite* sprite, s16 xPos, s16 yPos);
		bool IsCanvasBlank(u32* canvas);

		bool Unit1();
		bool Unit2();
		bool Unit3();
		bool Unit4();
		bool Unit5();
		bool Unit6();
		bool Unit7();
		bool Unit8();
		bool Unit9();
		bool Unit10();

		void Performance();
	}
}

#endif // DEBUG_RENDERTEST_H
*/
