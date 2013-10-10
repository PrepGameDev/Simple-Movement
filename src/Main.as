package {
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	
	/**
	 * ...
	 * @author Danny Weitekamp
	 */
	public class Main extends Sprite {
		//The graphical object containing our player (red circle)
		public var player:Sprite = new Sprite
		//A set of boolean properties (true or false) representing whether or not the W,S,A,D
		//	keys are being held down
		public var wIsDown:Boolean = false
		public var sIsDown:Boolean = false
		public var aIsDown:Boolean = false
		public var dIsDown:Boolean = false
		//The player's velocity in the X and Y direction
		//	velocity takes the unit pixels/frame
		//	-VX means we're moving left +VX means we're moving right
		//	-VY means we're moving up +VY means we're moving down (remember 0,0 is in the top left)
		public var playerVX:Number = 0
		public var playerVY:Number = 0
		//The player's acceleration in the X and Y direction
		//	acceleration takes the unit (pixels/frame)/frame -> (its the rate of the change in velocity per frame)
		public var playerAX:Number = 0
		public var playerAY:Number = 0
		//Note: if we set the FPS (frames per second) to 30, then each frame is equal to (1/30)seconds
		
		public function Main():void {
			//Draw a red circle with radius 20 into our player Sprite
			player.graphics.beginFill(0xFF0000)
			player.graphics.drawCircle(0, 0, 20)
			//Add the sprite to the stage
			stage.addChild(player)
			//place the player at coordinates (200,200)
			player.x = 200
			player.y = 200
			
			
			//add a listener for the frame loop
			stage.addEventListener(Event.ENTER_FRAME, enterFrame)
			
			//add a listener for the key down and up events			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown)
			stage.addEventListener(KeyboardEvent.KEY_UP, keyUp)
		
		}
		
		public function enterFrame(e:Event = null):void {
			//Check which WSAD keys are being pressed and then apply the appropriate acceleration
			if(wIsDown){
				playerAY -= .3
			}
			if(sIsDown){
				playerAY += .3
			}
			if(aIsDown){
				playerAX -= .3
			}
			if(dIsDown){
				playerAX += .3
			}
			//Integrate acceleration
			playerVX += playerAX
			playerVY += playerAY
			//Apply damping to velocity
			playerVX *= .7
			playerVY *= .7
			//Integrate velocity
			player.x += playerVX
			player.y += playerVY
			
			//Note: the integrals above are approximations... we are not using calculus
			
		}
		
		public function keyDown(e:KeyboardEvent):void {
			//Check which key was pressed
			if (e.keyCode == 87) {
				wIsDown = true				
			}
			if (e.keyCode == 83) {
				sIsDown = true				
			}
			if (e.keyCode == 65) {
				aIsDown = true				
			}
			if (e.keyCode == 68) {
				dIsDown = true				
			}		
		}
		public function keyUp(e:KeyboardEvent):void {
			//Check which key was released
			if(e.keyCode == 87){
				wIsDown = false
			}
			if(e.keyCode == 83){
				sIsDown = false
			}
			if(e.keyCode == 65){
				aIsDown = false
			}
			if(e.keyCode == 68){
				dIsDown = false
			}
		}
		
	}
	
}