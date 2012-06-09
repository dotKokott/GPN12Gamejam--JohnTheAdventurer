package
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Key;
	
	[SWF(width="800",height="608")]
	public class Main extends Engine
	{
		public function Main()
		{			
			super(800, 608, 60, false);				
			FP.world = new GameWorld();
		}

		override public function init():void
		{
			(FP.world as GameWorld).loadLevel("");
		}		
	}
}