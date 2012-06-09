package  
{
	import flash.geom.Point;
	import flash.utils.ByteArray;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Tilemap;
	import net.flashpunk.masks.Grid;
	public class OgmoImport
	{
		
		public var width:int;
		public var height:int;
		
		public var playerStart:Point;
		
		public var _tiles:Tilemap;
		public var _grid:Grid;
		
		private var _xmlData:XML;	
		
		public function OgmoImport(xml:Class) 
		{
			var rawData:ByteArray = new xml;
			var dataString:String = rawData.readUTFBytes(rawData.length);
			_xmlData = new XML(dataString);
			
			width = _xmlData.@width;
			height = _xmlData.@height;
			
			playerStart = new Point(_xmlData.@playerStartX, _xmlData.@playerStartY);
	
			_tiles = new Tilemap(Assets.SPRITE_TILESET, width, height, 32, 32);
			_grid = new Grid(width, height, 32, 32, 0, 0);
			var dataList:XMLList;
			var dataElement:XML;


			dataList = _xmlData.Solid.tile;			
			for each(dataElement in dataList)
			{	
				_tiles.setTile(int(dataElement.@x), int(dataElement.@y) , int(dataElement.@id));				
				_grid.setTile(int(dataElement.@x), int(dataElement.@y), true);				
			}
		}
				
		public function getLadders():Vector.<Ladder>
		{
			var ladders:Vector.<Ladder> = new Vector.<Ladder>();
			var tileList:XMLList = _xmlData.Ladders.Ladder;
			for each(var tileElement:XML in tileList)
			{								
				var l:Ladder = new Ladder(new Point(tileElement.@x, tileElement.@y));
				ladders.push(l);
			}
			
			return ladders;
		}
		
		public function getSigns():Vector.<Sign>
		{
			var signs:Vector.<Sign> = new Vector.<Sign>();
						
			var tileList:XMLList = _xmlData.Entities.Sign;
			for each(var tileElement:XML in tileList)
			{	
				trace(tileElement.@Text.toString().split(";"));
					var s:Sign = new Sign(tileElement.@Text.toString().split(";"))
					s.x = tileElement.@x;
					s.y = tileElement.@y;
					
					signs.push(s)
			}
			
			return signs;			
		}
		
		public function getEnemies():Vector.<Actor>
		{
			var enemies:Vector.<Actor> = new Vector.<Actor>();
			
			var tileList:XMLList = _xmlData.Marks.Mark;
			for each(var tileElement:XML in tileList)
			{					
				if (tileElement.@type == "turtle")
				{
					var turt:Turtle = new Turtle();
					turt.x = tileElement.@x;
					turt.y = tileElement.@y;
					enemies.push(turt);
				}				
				
				if (tileElement.@type == "tank")
				{
					var tank:Tank = new Tank();
					tank.x = tileElement.@x;
					tank.y = tileElement.@y;
					enemies.push(tank);
				}
			}
			
			return enemies;
		}
		
		public function getDialogTriggers():Vector.<DialogTrigger>
		{
			var dgs:Vector.<DialogTrigger> = new Vector.<DialogTrigger>();
						
			var tileList:XMLList = _xmlData.Triggers.DialogTrigger;
			for each(var tileElement:XML in tileList)
			{	
				var dg:DialogTrigger = new DialogTrigger(tileElement.@text.toString().split(";"));
				dg.x = tileElement.@x;
				dg.y = tileElement.@y;
					
				dgs.push(dg)
			}
			
			return dgs;				
		}
	}

}