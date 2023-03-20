#include "render.h"

#include <cassert>
#include <string.h>

#include "object.h"


snake::render::Sprite g_spriteLibrary[SPRITE_COUNT];

u32 canvas[CANVAS_HEIGHT * CANVAS_WIDTH];

u32* image_buffer_pointer = (u32 *)0x00900000;

namespace snake
{
	namespace render
	{
		bool SpriteInit(struct Sprite* sprite, const u32* data, u16 width, u16 height, u8 scaleShift)
		{
			if(!sprite)
			{
				return false;
			}

			sprite->m_spriteData = data;
			sprite->m_width = width;
			sprite->m_height = height;

			return true;
		}

		void Init()
		{
			for(u32 i = snake::sprites::ADJUST; i < snake::sprites::__ENUM_END__; ++i)
			{
				SpriteInit(
					&g_spriteLibrary[i],
					snake::sprites::GraphicsData[i],
					snake::sprites::SpriteWidths[i],
					snake::sprites::SpriteHeights[i],
					2u
				);
			}
		}

		Sprite* GetSprite(snake::sprites::SpriteIndex spriteIndex)
		{
			assert(spriteIndex < snake::sprites::__ENUM_END__ && spriteIndex >= snake::sprites::__ENUM_START__);

			return &g_spriteLibrary[spriteIndex];
		}

		void GetDrawBounds(const Sprite* sprite, s32 xPos, s32 yPos, s32& xStart, s32& xEnd, s32& yStart, s32& yEnd)
		{
			const s32 maxWidth = CANVAS_WIDTH - 1;
			const s32 maxHeight = CANVAS_HEIGHT - 1;
			
			s32 minBoundX = xPos;
			s32 maxBoundX = xPos + sprite->m_width;

			s32 minBoundY = yPos;
			s32 maxBoundY = yPos + sprite->m_height;

			xStart = minBoundX < 0 ? -minBoundX : 0;
			yStart = minBoundY < 0 ? -minBoundY : 0;

			xEnd = maxBoundX > maxWidth ? (sprite->m_width) - (maxBoundX - maxWidth) : (sprite->m_width);
			yEnd = maxBoundY > maxHeight ? (sprite->m_height) - (maxBoundY - maxHeight) : (sprite->m_height);
		}

		bool ClearCanvas(u32* canvas)
		{
			memset(canvas, CLEAR_COLOR, CANVAS_WIDTH * CANVAS_HEIGHT * sizeof(u32));

			return true;
		}

		bool DrawBackground(u32* canvas, u32* background)
		{
			memcpy(canvas, background, CANVAS_WIDTH * CANVAS_HEIGHT * sizeof(u32));

			return true;
		}

		s32 GetReadIndex(s16 xIndex, s16 yIndex, const Sprite* sprite)
		{
			return xIndex + sprite->m_width * yIndex;
		}

		s32 GetWriteIndex(s16 xIndex, s16 yIndex, s16 xPos, s16 yPos)
		{
			return (xIndex + xPos) + CANVAS_WIDTH * (yIndex + yPos);
		}

		bool PaintToCanvas(u32* canvas, const Sprite* sprite, s32 xPos, s32 yPos)
		{
			s32 xStart, yStart, xEnd, yEnd;

			GetDrawBounds(sprite, xPos, yPos, xStart, xEnd, yStart, yEnd);
			s32 drawLength = xEnd - xStart;

			for(s32 y = yStart; y < yEnd; ++y)
			{
				s32 readIndex = GetReadIndex(xStart, y, sprite);
				s32 writeIndex = GetWriteIndex(xStart, y, xPos, yPos);


				memcpy(canvas + writeIndex, sprite->m_spriteData + readIndex, drawLength * sizeof(u32));

				/*
				for(s16 y = yStart; y < yEnd; ++y)
				{


					assert(readIndex  >= 0);
					assert(writeIndex >= 0);
					assert(readIndex  <  sprite.m_width * sprite.m_height);
					assert(writeIndex <  CANVAS_HEIGHT * CANVAS_WIDTH);

					if(sprite.m_spriteData[readIndex] && ColorValue::Alpha == 0)
					{
						continue;
					}

					canvas[writeIndex] = sprite.m_spriteData[readIndex];
				}
				*/
			}

			return true;
		}

		void Render(RenderContext ctx)
		{
			int headIndex = object::GetObjectHead();
			snake::object::Object* objectLibrary = snake::object::GetObjectLibrary();

			ClearCanvas(canvas);

			for(RenderContext currentFlag = Background; currentFlag != render::End; currentFlag = static_cast<RenderContext>(currentFlag << 1))
			{
				if(ctx & currentFlag)
				{
					for(int i = 0; i < headIndex; ++i)
					{
						snake::object::Object obj = objectLibrary[i];
						PaintToCanvas(canvas, obj.m_sprite, obj.m_xPos, obj.m_yPos);
					}
				}
			}

			memcpy(image_buffer_pointer, canvas, CANVAS_HEIGHT * CANVAS_WIDTH);

			/*	alt. render call. needs debugging likely. hard to tell on high res.
			s16 xStart, yStart, xEnd, yEnd;

			xStart = xPos;
			yStart = yPos;
			xEnd = xPos + sprite.m_width;
			yEnd = yPos + sprite.m_height;

			xStart = xStart << Sprite::c_scaleShift < 0 ? 0 : xStart;
			yStart = yStart << Sprite::c_scaleShift < 0 ? 0 : yStart;

			xEnd = xEnd << Sprite::c_scaleShift > CANVAS_WIDTH  ? CANVAS_WIDTH  : xEnd;
			yEnd = yEnd << Sprite::c_scaleShift > CANVAS_HEIGHT ? CANVAS_HEIGHT : yEnd;

			for(s16 x = xStart; x < xEnd; ++x)
			{
				for(s16 y = yStart; y < yEnd; ++y)
				{
					s32 readIndex = xStart + yStart * sprite.m_width;
					s32 writeIndex = (xStart + yStart * sprite.m_width) << Sprite::c_scaleShift;

					assert(readIndex  >= 0);
					assert(writeIndex >= 0);
					assert(readIndex  <  sprite.m_width * sprite.m_height);
					assert(writeIndex <  CANVAS_HEIGHT * CANVAS_WIDTH);

					if(sprite.m_spriteData[readIndex] && ColorValue::Alpha == 0)
					{
						continue;
					}

#ifdef LOW_RENDER	// high render not supported. likely will go unused.
					canvas[writeIndex] = sprite.m_spriteData[readIndex];
					canvas[writeIndex + 1] = sprite.m_spriteData[readIndex];
					canvas[writeIndex + CANVAS_HEIGHT] = sprite.m_spriteData[readIndex];
					canvas[writeIndex + CANVAS_HEIGHT + 1] = sprite.m_spriteData[readIndex];
#endif
			*/
		}

		u32* GetCanvas()
		{
			return canvas;
		}

		u32* GetFrameBuffer()
		{
			return image_buffer_pointer;
		}

		void Draw()
		{
			memcpy(snake::render::GetFrameBuffer(), snake::render::GetCanvas(), CANVAS_HEIGHT * CANVAS_WIDTH * sizeof(u32));
		}
	}
}
