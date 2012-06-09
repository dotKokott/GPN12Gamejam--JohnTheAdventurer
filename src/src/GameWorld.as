package  
{
	import net.flashpunk.World;
	import net.flashpunk.FP;
		
	public class GameWorld extends World
	{
		[Embed(source = "../assets/levels/test.oel", mimeType = "application/octet-stream")] private static const DEFAULT_MAP:Class;
		
		public var player:Player;
		
		public var movementLocked:Boolean = false;
		
		public var currentLevel:Level;
		
		public function GameWorld() 
		{
			FP.screen.color = 0x0000FF;									
			currentLevel = new Level(DEFAULT_MAP);
			add(currentLevel);
			
		}
		
		public function loadLevel(levelFile:String):void
		{		
			currentLevel.loadLevel();			
		}
		
		override public function update():void 
		{
			super.update();
			Camera.followPlayer(player);
		}
		
	}

}