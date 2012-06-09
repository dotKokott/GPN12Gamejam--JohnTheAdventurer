package  
{
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;

	public class Healthbar
	{
		private var bar:Image;		
		private var barGraphic:Graphiclist;
			
		private var parent:Actor;
		public function Healthbar(parent:Actor) 
		{
			this.parent = parent;
			var frame:Image = Image.createRect(102, 10);
			frame.x = 0;
			frame.y = 0;
			
			var inside:Image = Image.createRect(100, 8, 0xFF000000);
			inside.x = 1;
			inside.y = 1;


			bar = Image.createRect(1, 8, 0xffff0000);
			bar.x = 1;
			bar.y = 1;
			bar.originX = 0;
			bar.originY = 0;

			bar.scaleX = 100;
			barGraphic = new Graphiclist(frame, inside, bar);
		}
		
		public function update():void
		{
			bar.scaleX = parent.health;
		}
			
		public function getGraphic():Graphiclist
		{
			return barGraphic;
		}
	}	

}