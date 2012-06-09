package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	
	public class Rocket extends Entity
	{
					
		public function Rocket() 
		{
			graphic = new Image(Assets.SPRITE_ROCKET);
			setHitbox(32, 32);	
			type = "cannonball";
		}
		
		override public function update():void 
		{
			x -= 240 * FP.elapsed;
		}
		
	}

}