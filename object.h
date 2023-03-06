#ifndef OBJECTLIBRARY_H
#define OBJECTLIBRARY_H

#include "xil_types.h"

#define OBJECT_COUNT	512	// likely more than we'll ever need


namespace snake
{
	namespace render
	{
		struct Sprite;
	}
}

namespace snake
{
	namespace object
	{
		// fill out later
		enum ObjectUpdate
		{

		};

		struct Object
		{
			snake::render::Sprite* m_sprite;
			u32 m_xPos, m_yPos;
			ObjectUpdate m_updateCtx;
		};

		bool ResgisterObject(snake::render::Sprite* sprite, ObjectUpdate updateCtx, Object*& outObject);

		Object* GetObjectLibrary();

		int GetObjectHead();
	}
}

#endif //OBJECTLIBRARY_H
