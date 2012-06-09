package  
{
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import flash.geom.Rectangle;

	public class Ladder extends Entity
	{		
		public function Ladder(position:Point) 
		{
			x = position.x;
			y = position.y;
			
			this.graphic = new Image(Assets.SPRITE_LADDER);
			
			setHitbox(32, 32);
			
			type = "ladder";
			//Image(graphic).color = 0xffba00;
		}		
	}
}