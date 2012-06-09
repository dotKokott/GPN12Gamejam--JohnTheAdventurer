package  
{
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.FP;
	
	public class Actor extends Entity
	{		
		public var velocityX:Number = 0.0;
		public var velocityY:Number = 0.0;
	
		public var currentAnimation:String = "idle_right";
		public var direction:String = "right";
		
		public var showHealthbar:Boolean = true;
		public var healthBar:Healthbar;
		public var health:int = 100;
		
		public var isClimbing:Boolean = false;
		
		
		public var spriteMap:Spritemap;
		
		public function Actor() 
		{
			spriteMap = this.getSpritemap();
			addGraphic(spriteMap);			
			healthBar = new Healthbar(this);
			addGraphic(healthBar.getGraphic());
		}
		
		
		
		public function getSpritemap():Spritemap
		{
			var playerSpritemap:Spritemap = new Spritemap(Assets.SPRITE_PLAYER, 96, 96);
			playerSpritemap.add("run_right", [0, 1, 2, 3, 4, 5, 6, 7], 15, true);
			playerSpritemap.add("run_left", [8, 9, 10, 11, 12, 13, 14, 15], 15, true);
			playerSpritemap.add("idle_right", [16, 17, 18, 19, 20, 21, 22], 15, true);
			playerSpritemap.add("idle_left", [24, 25, 26, 27, 28, 29, 30], 15, true);
			playerSpritemap.add("shoot_right", [32, 33, 32], 10, false);
			playerSpritemap.add("shoot_left", [34, 35, 34], 10, false);
			playerSpritemap.add("jump_right", [36], 0, true);
			playerSpritemap.add("jump_left", [37], 0, true);						
			
			return playerSpritemap;
		}
		
		override public function update():void 
		{
			var bullet:Object = collide("bullet", x, y);
			
			if (bullet)
			{
				bullet.die();
				this.health -= 20;
				if (this.health < 0)
					die();
			}
			
			var amountX:Number = velocityX * FP.elapsed;
			var amountY:Number = velocityY * FP.elapsed;
							
			
			for (var i:Number = 0; i < Math.abs(amountX); i += 0.1)
			{
				if (!collide("level", x + (FP.sign(amountX) * 0.1), y))
				{
					x += FP.sign(amountX) * 0.1;
				}
				else
				{
					velocityX = 0;
					break;
				}
			}					
					
			
			for (var i:Number = 0; i < Math.abs(amountY); i += 0.1)
			{
				if (!collide("level", x, y +(FP.sign(amountY) * 0.1)))
				{
					y += FP.sign(amountY) * 0.1;					
				}
				else
				{
					velocityY = 0;
					break;
				}				
			}
			
			spriteMap.play(getAnimation());		
			healthBar.update();
			if (!isClimbing)
			{
				velocityY += 20;						
			}
			else
			{
				velocityY = 0;
			}		
		}		
		
		public function getAnimation():String
		{
			if (!collide("level", x, y + 1))
			{
				return "jump_" + direction;	
			}
			else
			{
				if (FP.sign(velocityX) != 0)
				{
					return "run_" + direction;
				}
				else
				{
					return "idle_" + direction;
				}									
			}	
		}
		
		public function die():void
		{
			world.remove(this);
		}
	}
}