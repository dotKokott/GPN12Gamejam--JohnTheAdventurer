package  
{
	import flash.geom.Point;
	import net.flashpunk.FP;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	public class Player extends Actor
	{
		private var shootTimer:int = 0;
		private var shootTimeout:int = 5;
		private var shooting:Boolean = false;
					
		private var spaceReleased:Boolean = true;						
		
		public function Player() 
		{
			graphic.x = -36;
			graphic.y = -32;
			setHitbox(28, 60);
			x = 100;
			y = 500;
			
			type = "player";
		}
		
		override public function update():void 
		{	
			if (y > 1000)
				die();
			
			if (!(world as GameWorld).movementLocked)
			{
				if (Input.check(Key.LEFT))
				{
					direction = "left";				
					velocityX = -200;
				}
				if(Input.check(Key.RIGHT))
				{
					direction = "right";
					
					velocityX = 200;
				}
				
				if (!Input.check(Key.LEFT) && !Input.check(Key.RIGHT))
				{					
					velocityX = 0;
				}				
				
				if (Input.check(Key.SPACE))
				{	
					if (spaceReleased)
					{
						velocityX = 0;
						shoot();											
					}
					
					spaceReleased = false;
				}
				else
				{
					spaceReleased = true;
				}
				
				if (collide("ladder", x, y))
				{
					if (Input.check(Key.UP))
					{
						isClimbing = true;
						velocityY = -100;
					}
					
					if (Input.check(Key.DOWN))
					{
						isClimbing = true;
						velocityY = 100;
					}
				}
				else
				{
					isClimbing = false;
				}
								
				if (Input.check(Key.DOWN) && collide("level", x, y + 1) && !isClimbing)
				{
					velocityY = -500;
				}				
							
			
			super.update();
			}
		}		
		
		public function shoot():void
		{
			var bulletY:int = this.y + 30;
			var bulletX:int = this.x - 10;
			
			if (direction == "right")
			{
				bulletX += 50;
			}
			
			var bulDirection:int = 1;
			if (direction == "left")
				bulDirection = -1;
			
			var bullet:Bullet = new Bullet(bulletX, bulletY, bulDirection);
			bullet.velocityY = 400;
			world.add(bullet);						
			shooting = true;
			shootTimer = 0;	
		}
		
		override public function getAnimation():String 
		{
			if (Input.check(Key.SPACE))
			{
				return "shoot_" + direction;
			}
			
			return super.getAnimation()
		}		
		
		override public function die():void 
		{
			x = y = 0;
			health = 100;
		}
	}	
}