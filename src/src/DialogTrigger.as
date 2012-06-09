package  
{
	import net.flashpunk.Entity;
	public class DialogTrigger extends Entity
	{
		private var textParts:Array;
		private var triggered:Boolean = false;
		public function DialogTrigger(textParts:Array) 
		{
			this.textParts = textParts;
			width = 32;
			height = 32;
		}
		
		override public function update():void 
		{
			if (collide("player", x, y) && !triggered)
			{
				triggered = true;
				world.add(new DialogBox(textParts, true));
				(world as GameWorld).player.velocityX = (world as GameWorld).player.velocityY = 0;
			}
		}			
		
	}

}