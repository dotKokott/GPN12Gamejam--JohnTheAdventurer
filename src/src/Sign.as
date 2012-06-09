package  
{
	import net.flashpunk.Entity
	import DialogBox
	import net.flashpunk.graphics.Image;
	public class Sign extends Entity
	{
		public var dBox:DialogBox;
		public var boxVisible:Boolean = false;
		public function Sign(textParts:Array) 
		{
			graphic = new Image(Assets.SPRITE_SIGN);
			setHitbox(60, 61);
			width = 60;
			height = 61;
			dBox = new DialogBox(textParts, false);
			layer = 1000;
			type = "sign";			
		}
		
		override public function update():void 
		{
			if (collide("player", x, y))
			{
				if (!boxVisible)
				{
					dBox.currentPart = 0;
					boxVisible = true;
					world.add(dBox);
				}										
			}
			else
			{
				if (boxVisible)
				{
					boxVisible = false;
					dBox.removeFromWorld();
				}
			}
		}
		
	}

}