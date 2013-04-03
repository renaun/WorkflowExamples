package
{
import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;

import starling.core.Starling;

[SWF(width="500", height="400", frameRate="60", backgroundColor="#F0F0F0")]
public class Starling8WayCharacterAnimation extends Sprite
{
	public function Starling8WayCharacterAnimation()
	{
		
		// These settings are recommended to avoid problems with touch handling
		stage.scaleMode = StageScaleMode.NO_SCALE;
		stage.align = StageAlign.TOP_LEFT;
		
		// Create a Starling instance that will run the "Game" class
		mStarling = new Starling(Game, stage);
		mStarling.start();
	}
	private var mStarling:Starling;
}
}