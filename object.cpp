#include "object.h"

#include "render.h"

snake::object::Object g_objectLibrary[OBJECT_COUNT];
u16 g_objHeadIndex = 0;

namespace snake
{
	namespace object
	{
		Object* GetUnusedObject()
		{
			if(g_objHeadIndex >= OBJECT_COUNT)
			{
				return nullptr;
			}

			return &g_objectLibrary[g_objHeadIndex++];
		}

		bool ResgisterObject(snake::render::Sprite* sprite, ObjectUpdate updateCtx, Object*& outObject)
		{
			outObject = GetUnusedObject();

			if(!outObject)
			{
				return false;
			}

			outObject->m_sprite = sprite;
			outObject->m_xPos = 0;
			outObject->m_yPos = 0;
			outObject->m_updateCtx = updateCtx;

			return true;
		}

		Object* GetObjectLibrary()
		{
			return g_objectLibrary;
		}

		int GetObjectHead()
		{
			return g_objHeadIndex;
		}
	}
}
