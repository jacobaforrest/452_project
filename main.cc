
// #define TEST_SUITE

/*
#include "string.h"
#include "xil_cache.h"

#include "DEBUG_renderTest.h"
#include "render.h"
#include "input.h"
#include "stdlib.h"

#ifdef TEST_SUITE
#include "test.h"
#endif

void Init()
{

}

enum RenderDisplay
{
	GraphicsTest,
	PerfTest,
	GameplayExample,
	__SIZE__
};

void DrawObjects(snake::render::DummyObject* dummyObjects, u32 size, u32* background)
{
	if(background)
	{
		snake::render::DrawBackground(snake::render::GetCanvas(), background);
	}
	else
	{
		snake::render::ClearCanvas(snake::render::GetCanvas());
	}

	for(u32 i = 0; i < size; ++i)
	{
		PaintToCanvas(snake::render::GetCanvas(), *dummyObjects[i].m_sprite, dummyObjects[i].m_xPos, dummyObjects[i].m_yPos);
	}

	snake::render::Draw();
}

int main()
{
	Init();
#ifdef TEST_SUITE
	debug::TestMain();
#else
	snake::render::DummyObject dummyObjects[snake::sprites::__ENUM_END__];
	debug::render::GetGraphicsTest(dummyObjects);

	snake::render::DummyObject stressTest[STRESS_TEST_COUNT];
	debug::render::GetStressTest(stressTest);

	u32* background = (u32*) malloc(CANVAS_WIDTH * CANVAS_HEIGHT * sizeof(u32));

	snake::render::DummyObject gameplayDemo[19];
	debug::render::GetGameplayDemoScreen(gameplayDemo, background);

	DrawObjects(dummyObjects, snake::sprites::__ENUM_END__, nullptr);

	RenderDisplay renderDisplay = GraphicsTest;

	while(1)
	{
		s32 input = snake_GetInputFlags();

		if(input != 0)
		{
			// I hate c type conversions mixed with c++ type safety. truly the worst of both worlds.
			renderDisplay = (RenderDisplay)(1 + (u32)renderDisplay);
			renderDisplay = (RenderDisplay)(renderDisplay % __SIZE__);
		}

		if(renderDisplay == GraphicsTest)
		{
			DrawObjects(dummyObjects, snake::sprites::__ENUM_END__, nullptr);
		}
		else if(renderDisplay == PerfTest)
		{
			DrawObjects(stressTest, STRESS_TEST_COUNT, nullptr);
		}
		else if(renderDisplay == GameplayExample)
		{
			DrawObjects(gameplayDemo, 19, background);
		}
	}

	free(background);

#endif
	return 0;
}
*/
