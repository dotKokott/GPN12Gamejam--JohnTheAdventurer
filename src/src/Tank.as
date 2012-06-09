package  
{
	import net.flashpunk.graphics.Spritemap;
	public class Tank extends Actor
	{
		private var shootTimer:int = 0;
		private var shootTimeOut:int = 50;
		
		private var cemit:cloudEmitter;
		
		public function Tank() 
		{
			setHitbox(380, 238);
			type = "tank";
			direction = "left";
			health = 100;
			
			cemit = new cloudEmitter(x -35 , y + 36);			
		}
		
		
		public override function getSpritemap():Spritemap
		{
			var tankSpritemap:Spritemap = new Spritemap(Assets.SPRITE_TANK, 380, 238);
			tankSpritemap.add("run_left", [0, 1, 2, 3], 15, true);
			tankSpritemap.add("run_right", [4, 5, 6, 7], 15, true);
			tankSpritemap.add("idle_left", [0, 1, 2, 3], 15, true);
			tankSpritemap.add("idle_right", [4, 5, 6, 7], 15, true);
			
			return tankSpritemap;
		}
		
		override public function update():void 
		{
			
			super.update();
			if ((world as GameWorld).player.x > x - 800)
			{
				shoot();
			}
		}
		
		public function shoot():void
		{
			cemit.x = x;
			cemit.y = y;
			if (shootTimer < shootTimeOut)
			{
				shootTimer++;
			}
			else
			{
				var cob:Rocket = new Rocket()
				cob.x = x - 35;
				cob.y = y + 35;
				
				world.add(cob);
				world.add(new cloudEmitter(cob.x, cob.y));
				
				shootTimer = 0;
			}			
		}
	}

}