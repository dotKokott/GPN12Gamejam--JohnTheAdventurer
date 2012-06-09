package
{
	import flash.utils.ByteArray;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Tilemap;
	import net.flashpunk.masks.Grid;

	public class Level extends Entity
	{	
		
		public var oImport:OgmoImport;
		public function Level(xml:Class)
		{
			var oImport:OgmoImport = new OgmoImport(xml);
			this.oImport = oImport;
			
			graphic = oImport._tiles;
			layer = 1;
			mask = oImport._grid;
			type = "level";		
		}
		
		public function loadLevel():void 
		{	
			var bg:Entity = new Entity(0, 0, new Image(Assets.SPRITE_BG));
			bg.collidable = false;
			bg.layer = 5000;
			bg.graphic.scrollX = bg.graphic.scrollY = 0;
			world.add(bg);
			
			for each(var l:Ladder in oImport.getLadders()) 
			{
				world.add(l);				
			}
			
			for each(var s:Sign in oImport.getSigns())
			{
				world.add(s);
			}
			
			for each(var e:Actor in oImport.getEnemies())
			{
				world.add(e);				
			}
			
			var player:Player = new Player();
			player.x = oImport.playerStart.x;
			player.y = oImport.playerStart.y;
			
			world.add(player);
			(world as GameWorld).player = player;
			
			for each(var dg:DialogTrigger in oImport.getDialogTriggers())
			{
				world.add(dg);
			}
			
			world.add(new DestroyableBox(1100, 440, 10, 60));
		}
	}

}