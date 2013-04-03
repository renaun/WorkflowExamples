package
{
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.text.TextField;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;

public class Game extends Sprite
{
	// Embed the Atlas XML
	[Embed(source="../../8way.xml", mimeType="application/octet-stream")]
	public static const AtlasXml:Class;
	
	// Embed the Atlas Texture:
	[Embed(source="../../8way.png")]
	public static const AtlasTexture:Class;
	
	public function Game()
	{
		// create atlas
		var texture:Texture = Texture.fromBitmap(new AtlasTexture());
		var xml:XML = XML(new AtlasXml());
		var atlas:TextureAtlas = new TextureAtlas(texture, xml);
		
		// display a sub-texture
		//var textures:Vector.<Texture> = atlas.getTextures("DirN");
		var directions:Array = ["DirE", "DirSE", "DirS", "DirSW", "DirW", "DirNW", "DirN", "DirNE"];
		var i:int = 0;
		var mc:MovieClip;
		for each (var name:String in directions)
		{
			mc = new MovieClip(atlas.getTextures(name+"00"), 16 );
			mc.loop = true;
			mc.stop();
			mc.visible = false;
			directionAnimations.push(mc);
			addChild(mc);	
			Starling.juggler.add(mc);
		}
		currentMC = mc;
		mc.visible = true;
		
		//addChild(text);
		
		addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
	}
	
	public var text:TextField = new TextField(360, 80, "hello");
	public var currentMC:MovieClip;
	public var currentDirection:int = 0;
	public var directionAnimations:Array = [];
	private var isDown:Boolean = false;
	
	private function addedToStageHandler(event:Event):void
	{
		var mc:MovieClip;
		for (var i:int = 0; i < directionAnimations.length; i++) 
		{
			mc = directionAnimations[i];	
			mc.x = (stage.stageWidth - mc.width)/2;
			mc.y = (stage.stageHeight - mc.height)/2;
		}
		
		stage.addEventListener(TouchEvent.TOUCH, touchHandler);
	}
	
	private function touchHandler(event:TouchEvent):void
	{
		var touch:Touch = event.getTouch(stage, TouchPhase.MOVED);
		var touch2:Touch = event.getTouch(stage, TouchPhase.ENDED);
		if (touch2)
			currentMC.stop();
		if (touch)
		{
			var localPos:Point = touch.getLocation(stage);
			var sX:Number = localPos.x;
			var sY:Number = localPos.y;
			
			var dirIndex:int = 0;
			var angle:Number = Math.atan2((sX - currentMC.x + currentMC.width/2) , (sY - currentMC.y + currentMC.height/2));
			
			//text.text = "Angle: " + angle;
			if (angle > 0.0 && angle < 0.6)
				dirIndex = 3; // looking down
			else if (angle > -0.6 && angle < 0.0)
				dirIndex = 4; // bottom left
			else if (angle > -1.4 && angle < -0.6)
				dirIndex = 5; // left
			else if (angle > -3.0 && angle < -1.4)
				dirIndex = 6; // top left
			//else if ((angle < -2.8 && angle > -3.2) || (angle < 3.2 && angle > 2.8))
			else if ((angle < 3 && angle > 2.2) )
				dirIndex = 7; // up
			else if (angle < 2.2 && angle > 1.4)
				dirIndex = 8; // right top
			else if (angle < 1.4 && angle > 0.9)
				dirIndex = 1; // right
			else if (angle < 0.9 && angle > 0.6)
				dirIndex = 2; // right bottom
			
			if (dirIndex != currentDirection)
			{
				//currentMC.stop();
				currentMC.visible = false;
				currentMC = directionAnimations[dirIndex-1];
				currentMC.visible = true;
				currentMC.play();
			}
		}
	}
}
}