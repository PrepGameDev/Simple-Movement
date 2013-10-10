package {
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	
	/**
	 * ...
	 * @author Danny Weitekamp
	 */
	public class Main extends Sprite {
		public var player:Sprite = new Sprite
		public var wIsDown:Boolean = false
		public var sIsDown:Boolean = false
		public var aIsDown:Boolean = false
		public var dIsDown:Boolean = false
		public var playerVX:Number = 0
		public var playerVY:Number = 0
		public var playerAX:Number = 0
		public var playerAY:Number = 0
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
			//player.x += 3
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
			playerVX += playerAX
			playerVY += playerAY
			playerVX *= .7
			playerVY *= .7
			player.x += playerVX
			player.y += playerVY
			
		}
		
		public function keyDown(e:KeyboardEvent):void {
			//W was pressed
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