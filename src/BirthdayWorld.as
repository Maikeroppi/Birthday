package
{
	import net.flashpunk.World;
	public class BirthdayWorld extends World
	{
		

		
		public function BirthdayWorld()
		{

		}
		
		override public function begin():void
		{
			var level:Level = new Level(Assets.Level1);
			var dataList:XMLList = level.LevelData.Objects.Player;
			var dataElement:XML;
			
			for each(dataElement in dataList)
			{
				add(new Player(int(dataElement.@x), int(dataElement.@y)));
			}
			add(level);			
			super.begin();
		}
	}
}