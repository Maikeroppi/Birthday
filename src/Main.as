package 
{
import net.flashpunk.Engine;
import net.flashpunk.FP;

	public class Main extends Engine
	{
		public function Main()
		{
			super(Assets.kScreenWidth, Assets.kScreenHeight, 60, false);
			FP.console.enable();
		}
		
		override public function init():void
		{
			trace("FlashPunk has started successfully!");
			FP.world = new BirthdayWorld();
			super.init();
		}
	}	
}