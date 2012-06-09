package  
{
	import flash.display.BitmapData;

	public class Assets
	{
		[Embed(source='../assets/tileset.png')]
		public static const SPRITE_TILESET:Class;
		
		[Embed(source = '../assets/bullet.png')]
		public static const SPRITE_BULLET:Class;
		
		[Embed(source = '../assets/player_run.png')] 
		public static const SPRITE_PLAYER:Class;	
		
		[Embed(source = '../assets/turtle.png')] 
		public static const SPRITE_TURTLE:Class;	
		
		[Embed(source = '../assets/sign.png')]
		public static const SPRITE_SIGN:Class;
		
		[Embed(source = '../assets/ladder.png')] 
		public static const SPRITE_LADDER:Class;
		
		[Embed(source = '../assets/tank.png')] 
		public static const SPRITE_TANK:Class;	
		
		[Embed(source = '../assets/BG_1.png')] 
		public static const SPRITE_BG:Class;
		
		[Embed(source = '../assets/cannonball.png')] 
		public static const SPRITE_ROCKET:Class;	
	}
}