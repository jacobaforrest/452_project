#ifndef RENDER_H
#define RENDER_H

#include "xil_types.h"
#include "sprites.h"

#define LOW_RENDER

#ifdef LOW_RENDER
#define CANVAS_WIDTH 	640
#define CANVAS_HEIGHT	480
#else
// for some reason the higher res is causing an exception when writing the frame buffer
// likely not a huge deal since we'll be using a low resolution but still scary.
#define CANVAS_WIDTH 	1280
#define CANVAS_HEIGHT	1024
#endif


// #define RENDER_HEIGHT	256
// #define RENDER_WIDTH	320

// #define RENDER_SCALE = CANVAS_HEIGHT / RENDER_HEIGHT

// can be changed as needed. caps unique sprites in game
#define SPRITE_COUNT	128

#define CLEAR_COLOR 0x00000000

namespace snake
{
	namespace render
	{
		// note: ordered by render priority
		enum RenderContext : u32
		{
			Background	= 1 << 0,
			GameObject	= 1 << 1,
			HUD			= 1 << 2,
			Menu		= 1 << 3,
			Debug		= 1 << 4,
			End			= 1 << 5	// update this to always be the last. used for enum itr.
		};

		enum ColorValue : u32
		{
			Alpha = 0xFF000000,
			Blue  = 0x00FF0000,
			Green = 0x0000FF00,
			Red   = 0x000000FF
		};

		// Note: scale shift is the amount which sprite dimensions will be BIT SHIFTED by.
		struct Sprite
		{
			const u32* m_spriteData;

			u16 m_width, m_height;
#ifdef LOW_RENDER
			static const u8 c_scaleShift = 0u;
#else
			static const u8 c_scaleShift = 0u;
#endif
		};

		struct DummyObject
		{
			Sprite* m_sprite;
			s16 m_xPos;
			s16 m_yPos;
		};

		void Init();

		Sprite* GetSprite(snake::sprites::SpriteIndex spriteIndex);

		void GetDrawBounds(const Sprite* sprite, s32 xPos, s32 yPos, s32& xStart, s32& xEnd, s32& yStart, s32& yEnd);

		bool ClearCanvas(u32* canvas);

		bool DrawBackground(u32* canvas, u32* background);

		bool PaintToCanvas(u32* canvas, const Sprite* sprite, s32 xPos, s32 yPos);

		s32 GetReadIndex(s16 xIndex, s16 yIndex, const Sprite* sprite);
		s32 GetWriteIndex(s16 xIndex, s16 yIndex, s16 xPos, s16 yPos);

		void Render(RenderContext ctx);

		u32* GetCanvas();
		u32* GetFrameBuffer();

		void Draw();


		snake::sprites::SpriteIndex getEnumNum(int num);
	}
}

#endif //RENDER_H
