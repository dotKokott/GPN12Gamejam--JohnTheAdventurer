package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	
	public class Bullet extends Entity
	{
		public var speed:int = 1000;
		public var velocityX:int = 1000;
		public var velocityY:int = 0;
		
		private var distance:int = 2000;
		private var travelled:int = 0;
		
		public function Bullet(posX:int, posY:int, direction:int) 
		{
			var bulImg:Image = new Image(Assets.SPRITE_BULLET);

			width = 5;
			height = 3;
			graphic = bulImg;
		
			velocityX *= direction;
			x = posX;
			y = posY;
								
			setHitbox(5, 3);
			
			type = "bullet";
			FP.watch("x","y");
		}
		
		public function die():void
		{
			world.remove(this);			
		}
		
		override public function update():void 
		{
			
			var amountX:Number = velocityX * FP.elapsed;
			var amountY:Number = velocityY * FP.elapsed;
			
			for (var i:Number = 0; i < Math.abs(amountX); i += 0.1)
			{
				var wall:Object = collide("level",  x + (FP.sign(amountX) * 0.1), y);
				if (!wall)
				{
					x += FP.sign(amountX) * 0.1;
				}
				else
				{
					die();
					break;
				}											
			}
			
			travelled += Math.abs(amountX);
			if (travelled >= distance)
				world.remove(this);
			
					
			for (var i:Number = 0; i < Math.abs(amountY); i += 0.1)
			{
				var wall:Object = collide("level",  x, y + (FP.sign(amountY) * 0.1));
				if (!wall)
				{
					y += FP.sign(amountY) * 0.1;
				}
				else
				{
					die();
					break;
				}											
			}
			
		}		
	}

}