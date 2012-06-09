package  
{
	import net.flashpunk.Entity
	
	public class DestroyableBox extends Entity
	{
				
		public function DestroyableBox(posX:int, posY:int,height:int, width:int) 
		{
			x = posX;
			y = posY;
			this.height = height;
			this.width = width;						
			
			type = "level";
		}		
		
	}	
}