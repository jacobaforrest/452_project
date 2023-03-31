#include "collision.h"

#include "snakeHelper.h"

namespace snake
{
	namespace collision
	{
		CollisionFlag DetectCollision()
		{
			CollisionFlag collision = none;

			SnakeComponent* head = snake::GetHead();

			u32 foodX, foodY;

			snake::GetApplePosition(foodX, foodY);

			OverlapDims headDims {head->m_xPos, head->m_yPos, SNAKE_BOUNDS, SNAKE_BOUNDS};

			if( Overlap(
				headDims,
				{GRID_START_X + foodX * FOOD_BOUNDS,
				GRID_START_Y + foodY * FOOD_BOUNDS,
				FOOD_BOUNDS,
				FOOD_BOUNDS} )
			)
			{
				collision = static_cast<CollisionFlag>(
						static_cast<CollisionFlag>(collision)
						| static_cast<CollisionFlag>(apple));

				collision = static_cast<CollisionFlag>(
						static_cast<CollisionFlag>(collision)
						| static_cast<CollisionFlag>(bodyApple));
			}

			if( IsOutOfBounds(head->m_xPos, head->m_yPos, SNAKE_BOUNDS, SNAKE_BOUNDS) )
			{
				collision = static_cast<CollisionFlag>(
					static_cast<CollisionFlag>(collision)
					| static_cast<CollisionFlag>(wall));
			}

			snake::SnakeComponent* body = head->m_next;

			while(body && body->m_init)
			{
				if( Overlap( headDims, {body->m_xPos, body->m_yPos, SNAKE_BOUNDS, SNAKE_BOUNDS} ) )
				{
					collision = static_cast<CollisionFlag>(
							static_cast<CollisionFlag>(collision)
							| static_cast<CollisionFlag>(snake));
				}

				if( Overlap( {body->m_xPos, body->m_yPos, SNAKE_BOUNDS, SNAKE_BOUNDS}, {GRID_START_X + foodX * FOOD_BOUNDS,
						GRID_START_Y + foodY * FOOD_BOUNDS,
						FOOD_BOUNDS,
						FOOD_BOUNDS} ) )
				{
					collision = static_cast<CollisionFlag>(
							static_cast<CollisionFlag>(collision)
							| static_cast<CollisionFlag>(bodyApple));
				}

				body = body->m_next;
			}

			return collision;
		}

		bool Overlap(const OverlapDims& first, const OverlapDims& second)
		{
			bool xOverlap = (first.m_xPos <= second.m_xPos && second.m_xPos < (first.m_xPos + first.m_width)) ||
							(second.m_xPos <= first.m_xPos && first.m_xPos < (second.m_xPos + second.m_width));

			bool yOverlap = (first.m_yPos <= second.m_yPos && second.m_yPos < (first.m_yPos + first.m_height)) ||
							(second.m_yPos <= first.m_yPos && first.m_yPos < (second.m_yPos + second.m_height));

			return xOverlap && yOverlap;
		}

		bool IsOutOfBounds(u32 xPos, u32 yPos, u32 width, u32 height)
		{
			return  xPos < GRID_START_X ||
					xPos > GRID_START_X + (GRID_SIZE - 1) * SNAKE_BOUNDS ||
					yPos < GRID_START_Y ||
					yPos > GRID_START_Y + (GRID_SIZE - 1) * SNAKE_BOUNDS;
		}
	}
}
