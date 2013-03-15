package
{
    import System.Platform.Platform;
    import cocos2d.Cocos2DGame;
    import cocos2d.CCSprite;
    import cocos2d.CCSpriteFrame;
    import cocos2d.CCAnimation;
    import cocos2d.CCAnimationCache;
    import cocos2d.CCRect;
    import cocos2d.CCSize;
    import cocos2d.CCPoint;
    import System.Math;

    public class EightWayLoom extends Cocos2DGame
    {
        public var runner:CCSprite;
        public var dirIndex:int = -1;
        public var lastFrame:int = 0;

        override public function run():void
        {
            super.run();

            var size:CCSize;
            size.width = size.height = 80;
            var rect:CCRect;
            var animation = CCAnimation.animation();

            // Create a frame for each cell in the 
            for(var y=0; y<8; y++)
            {
            
               for(var x=0; x<8; x++)
               {
                  // Determine the bounds of the cell.
                  rect.setRect(x * size.width, y * size.height, size.width, size.height);

                  // Create and store the frame.
                  var frame = CCSpriteFrame.create("assets/greenblob.png", rect, false, new CCPoint(), size);
                  animation.addSpriteFrame(frame);
               }
               
            }

            // Cache the animation for later.
            CCAnimationCache.sharedAnimationCache().addAnimation(animation, "char8way");

            // Create the sprite that will display the animation.
            runner = CCSprite.create();
            runner.x = 240;
            runner.y = 160;
            runner.scale = 1;
            layer.addChild(runner);

            layer.onTouchBegan = changeDirection;
            layer.onTouchMoved = changeDirection;

            layer.onTouchEnded = function(id:int, xPos:int, yPos:int) {
               // Console.print("END: " + id + " - " + xPos +"/"+yPos);
                dirIndex = -1;
            }
        }

        public function changeDirection(id:int, xPos:int, yPos:int):void {
            var angle = Math.atan2(yPos - runner.y, xPos - runner.x);
            dirIndex = 1;
            if (angle < 0.4 && angle > -0.4)
                dirIndex = 1;
            else if (angle < -0.4 && angle > -1.2)
                dirIndex = 2;
            else if (angle < -1.2 && angle > -2.0)
                dirIndex = 3;
            else if (angle < -2.0 && angle > -2.8)
                dirIndex = 4;
            else if ((angle < -2.8 && angle > -3.2) || (angle < 3.2 && angle > 2.8))
                dirIndex = 5;
            else if (angle < 2.8 && angle > 2.0)
                dirIndex = 6;
            else if (angle < 2.0 && angle > 1.2)
                dirIndex = 7;
            else if (angle < 1.2 && angle > 0.4)
                dirIndex = 8;
            dirIndex -=  1;
            //Console.print(dirIndex + " - " + xPos +"/"+yPos + " - " + angle);
        }
        
        override public function onTick():void
        {
            
            // Based on elapsed time determine what frame we should show.
            var framesPerSecond = 12;
            var msPerFrame = 1000 / framesPerSecond;
            var animationAgeInMs = Platform.getTime();
            var walkCycleFrameCount = 8;
            var curFrame:int;
            if (dirIndex == -1)
                curFrame = lastFrame;
            else
                curFrame = (Math.floor(animationAgeInMs / msPerFrame)  % walkCycleFrameCount) + (dirIndex * 8);
            runner.setDisplayFrameWithAnimationName("char8way", curFrame);
            lastFrame = curFrame;
        }
    }
}