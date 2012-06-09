package  
{
	import net.flashpunk.FP;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;
	/**
	 * ...
	 * @author ...
	 */
	public class Turtle extends Actor
	{
		public var Health:int = 100;
		
				
		public function Turtle() 
		{
			graphic.x = -20;
			graphic.y = -50;
			setHitbox(70, 42);
			x = 600;
			y = 500;		
			
			type = "enemy";
			velocityX = 100;
		}
		
		override public function update():void 
		{
			if (direction == "right")
				velocityX = 50;
			if (direction == "left")
				velocityX = -50;
			if (collide("level", x + FP.sign(velocityX), y))
			{
				velocityX = -velocityX;
				if (velocityX > 0)
					direction = "right";
				if (velocityX < 0)
					direction = "left";
			}
			
			var colPlayer:Object = collide("player", x, y);
			if (colPlayer)
			{
				var player:Player = (colPlayer as Player);
				if ((FP.sign(colPlayer.velocityY) == 1) && (colPlayer.y + colPlayer.height) < (y + halfHeight))
				{
					player.velocityY = -player.velocityY;
					world.remove(this);
				}				
			}
					
			super.update();
		}
							
		override public function getSpritemap():Spritemap
		{
			var turtleSpritemap:Spritemap = new Spritemap(Assets.SPRITE_TURTLE, 96, 96);
			turtleSpritemap.add("run_right", [0, 1, 2, 3, 4], 15, true);
			turtleSpritemap.add("run_left", [5, 6, 7, 8, 9], 15, true);				
			
			return turtleSpritemap;
		}
		
		override public function getAnimation():String 
		{
			return super.getAnimation()
		}	
	}
}