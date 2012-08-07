package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Michael Eads
	 */
	public class Enemy extends Entity 
	{
		[Embed(source = "../enemy.png")]
		public const EnemyGraphic:Class;
		
		public function Enemy() 
		{
			graphic = new Image(EnemyGraphic);
			x = FP.rand(FP.screen.width);
			y = FP.rand(FP.screen.height);
			type = "enemy";
			setHitbox(Assets.kTileWidth, Assets.kTileHeight);
		}
		
	}

}