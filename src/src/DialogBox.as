package 
{
	import net.flashpunk.FP;	
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	public class DialogBox extends Entity
	{
		public var lockMovement:Boolean;
		public var parts:Array;
		
		public var frame:Image;
		public var inside:Image;			
		
		public var currentPart:int = 0;
		private var textControl:Text;
		
		private var updateTimer:int = 0;
		private var updateMax:int = 10;
		
		
		
		public function DialogBox(textParts:Array, lockMovement:Boolean) 
		{
			this.lockMovement = lockMovement;
			
			var posX:int = 300;
			var posY:int = 450;
			
			parts = textParts;
			
			frame = Image.createRect(400, 200);
			inside = Image.createRect(380, 180, 0x000000)
			frame.x = posX;
			frame.y = posY;
			
			frame.scrollX = frame.scrollY = 0;
			
			inside.x = posX + 10;
			inside.y = posY + 10;
			
			inside.scrollX = inside.scrollY = 0;			
			
			textControl = new Text(parts[currentPart], posX + 20, posY + 20);
			textControl.scrollX = textControl.scrollY = 0;
			
			
			graphic = new Graphiclist(frame,inside, textControl);				
		}				
		
		override public function update():void 
		{
			trace(updateTimer < updateMax);
			(world as GameWorld).movementLocked = lockMovement;
			if (updateTimer < updateMax)
			{
				updateTimer++;				
			}
			else
			{
				if (Input.check(Key.ENTER))
				{
					updateTimer = 0;
					if (parts.length - 1 == currentPart)
					{
						
						if (lockMovement)
						{
							(world as GameWorld).movementLocked = false;		
						}
						
						removeFromWorld();				
					}
					else
					{
						currentPart++;
					}				
				}
				
				textControl.text = parts[currentPart];					
			}					
		}
		
		public function removeFromWorld():void
		{
			currentPart = 0;
			if (world != null)
			{
				world.remove(this);	
			}
			
		}
	}

}