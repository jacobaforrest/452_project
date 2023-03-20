#ifndef COLLISION_H
#define COLLISION_H

#include "xil_types.h"

namespace snake
{
	namespace collision
	{
		enum CollisionFlag : u32
		{
			none 		= 0,
			apple 		= 1 << 0,
			wall 		= 1 << 1,
			snake 		= 1 << 2,
			bodyApple 	= 1 << 3,
		};


		struct OverlapDims
		{
			u32 m_xPos, m_yPos;
			u32 m_height, m_width;
		};

		snake::collision::CollisionFlag DetectCollision();

		bool Overlap(const OverlapDims& first, const OverlapDims& second);
	}
}

#endif // COLLISION_H
