package 
{
import net.flashpunk.Engine;
import net.flashpunk.FP;

	public class Main extends Engine
	{
		public function Main()
		{
			super(Assets.kScreenWidth, Assets.kScreenHeight, 60, false);
			FP.screen.scale = 2;
			FP.console.enable();
		}
		
		override public function init():void
		{
			trace("FlashPunk has started successfully!");
			//
			//Assets.ImageDictionary["Tiles.png"] = Assets.Tiles;
			//Assets.ImageDictionary["Chalkboard.png"] = Assets.Chalkboard;
			//Assets.ImageDictionary["enemy.png"] = Assets.EnemyImage;
			//Assets.ImageDictionary["TheBed.png"] = Assets.Bed;
			//Assets.ImageDictionary["TheTable.png"] = Assets.Table;
								//
			FP.world = new BirthdayWorld();
			super.init();
		}
	}	
}