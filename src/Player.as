package  
{
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	
	
	/**
	 * ...
	 * @author Maikeroppi
	 */
	public class Player extends Entity 
	{
		[Embed(source = "../player.png")]
		private const PlayerGraphic:Class;
		
		public var image:Image;
		public var V_:Point;
		
		public function Player(StartX:int, StartY:int) 
		{
			image = new Image(PlayerGraphic);
			graphic = image;
			V_ = new Point;
			
			x = StartX;
			y = StartY;
			setHitbox(Assets.kTileWidth, Assets.kTileHeight, 0, 0);
			type = "player";
		}
		
		override public function update():void 
		{
			updateMovement();
			updateCollision();
			
			super.update();
		}
		
		private function updateMovement():void
		{
			var movement:Point = new Point;
			
			if (Input.check(Key.RIGHT))	movement.x = 1;
			if (Input.check(Key.LEFT)) movement.x = -1;
			
			if (Input.check(Key.DOWN)) movement.y = 1;
			if (Input.check(Key.UP)) movement.y = -1;
			
			V_.x = 100 * FP.elapsed * movement.x;
			V_.y = 100 * FP.elapsed * movement.y;
		}
		
		private function updateCollision():void
		{
			x += V_.x;
			
			if(collide("level", x, y)) {
				if (FP.sign(V_.x) > 0) {
					// Moving Right
					V_.x = 0;
					x = Math.floor(x / Assets.kTileWidth) * Assets.kTileWidth + Assets.kTileWidth - width;
				} else {
					// Moving Left
					V_.x = 0;
					x = Math.floor(x / Assets.kTileWidth) * Assets.kTileWidth + Assets.kTileWidth;
				}
			}
			
			y += V_.y;
			if(collide("level", x, y)) {
				if (FP.sign(V_.y) > 0) {
					// Moving Right
					V_.y = 0;
					y = Math.floor(y / Assets.kTileHeight) * Assets.kTileHeight + Assets.kTileHeight - height;
				} else {
					// Moving Left
					V_.y = 0;
					y = Math.floor(y / Assets.kTileHeight) * Assets.kTileHeight + Assets.kTileHeight;
				}
			}
			
			
		}
	}

}