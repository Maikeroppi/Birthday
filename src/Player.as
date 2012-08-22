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
		
		// Player values
		public const PlayerHSpeed:Number = 70;
		public const PlayerVSpeed:Number = 50;
		public const JumpVelocity:Number = -150;
		public const Gravity:int = 4;
		
		private var image_:Image;
		private var Velocity_:Point;
		private var Acceleration_:Point;
		private var TouchingGround_:Boolean;
		
		private var CurrentLevelWidth_:Number;
		private var TheWorld_:BirthdayWorld;
		
		public function Player(StartX:int, StartY:int) 
		{
			image_ = new Image(PlayerGraphic);
			graphic = image_;
			Velocity_ = new Point(0, 0);
			Acceleration_ = new Point(0, 0);
			TouchingGround_ = false;
			CurrentLevelWidth_ = Assets.kScreenWidth;
			
			x = StartX;
			y = StartY;
			setHitbox(Assets.kTileWidth, Assets.kTileHeight, 0, 0);
			type = "player";
		}
		
		public function SetLevelWidth(Width:Number):void 
		{
			CurrentLevelWidth_ = Width;
		}
		
		public function SetWorld(World:BirthdayWorld):void
		{
			TheWorld_ = World;
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
			
			//if (Input.check(Key.DOWN)) movement.y = 1;
			if (Input.pressed(Key.UP)) jump();
			
			Acceleration_.y = Gravity;
			Velocity_.y += Acceleration_.y;
					
			Velocity_.x = PlayerHSpeed * movement.x;
			//Velocity_.y = PlayerVSpeed * movement.y;
			//x += Velocity_.x * FP.elapsed;
			//y += Velocity_.y * FP.elapsed;
		}
		
		protected function jump():void
		{
			if (TouchingGround_) 
			{
				Velocity_.y = JumpVelocity;
				TouchingGround_ = false;
			}
		}
		
		private function updateCollision():void
		{
			x += Velocity_.x * FP.elapsed;			
			if(collide("level", x, y)) {
				if (FP.sign(Velocity_.x) > 0) {
					// Moving Right
					Velocity_.x = 0;
					x = Math.floor(x / Assets.kTileWidth) * Assets.kTileWidth + Assets.kTileWidth - width;
				} else {
					// Moving Left
					Velocity_.x = 0;
					x = Math.floor(x / Assets.kTileWidth) * Assets.kTileWidth + Assets.kTileWidth;
				}
			}
			
			y += Velocity_.y * FP.elapsed;
			if (collide("level", x, y)) {
				TouchingGround_ = true;
				if (FP.sign(Velocity_.y) > 0) {
					// Moving Right
					Velocity_.y = 0;
					y = Math.floor(y / Assets.kTileHeight) * Assets.kTileHeight + Assets.kTileHeight - height;
				} else {
					// Moving Left
					Velocity_.y = 0;
					y = Math.floor(y / Assets.kTileHeight) * Assets.kTileHeight + Assets.kTileHeight;
				}
			}
			
			// Did we hit the door?
			if (collide("door", x, y)) {
				TheWorld_.changeLevel(Assets.Level1);
			}
			
			// Don't let player go off the level
			if(x < 0) x = 0;
			if (x > (CurrentLevelWidth_ - width)) x = CurrentLevelWidth_ - width;
			
			// Update camera
			FP.camera.x = x - (Assets.kScreenWidth / 2);
			
			// Don't go past left edge of level
			if (FP.camera.x < 0) FP.camera.x = 0;
			
			// Don't go past right edge of level
			var WidthFromEdge:Number = CurrentLevelWidth_ - Assets.kScreenWidth;
			if (FP.camera.x > WidthFromEdge) FP.camera.x = WidthFromEdge;
			
			
		}
	}

}