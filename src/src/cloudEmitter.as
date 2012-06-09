package
{	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Emitter;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Ease;

	public class cloudEmitter extends Entity {

		private var emitter:Emitter;
		private var timer:Number = 0;
		private var partical_count:int = 10;
		private var dustSpritemap:Spritemap
		private var startAngle:int;
		private var addAngle:int
		[Embed(source = '../assets/cloud.png')] private const SPRITE_DUST:Class;


		public function cloudEmitter(PlayerPosX:int, PlayerPosY:int)
		{		
			emitter = new Emitter(SPRITE_DUST,20,10);
			emitter.newType('cloud', [0]);
			emitter.setMotion('cloud',0, 20, 0.1, 360, 1, 1); 
			this.graphic = emitter;
			emitter.setAlpha('cloud',1,0,Ease.quintOut);
			hit(PlayerPosX, PlayerPosY);
		}



		public function hit(x:Number, y:Number):void {
			for (var i:int = 0; i < this.partical_count; i++) {
				emitter.emit('cloud', x, y);
			}
		}

	}

}
