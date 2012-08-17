package  
{
	import flash.utils.Dictionary;
	/**
	 * ...
	 * @author Maikeroppi
	 */
	public class Assets 
	{
		// Load up OGMO stuff
		
		
		[Embed(source = "../Level1.oel", mimeType = "application/octet-stream")]
		public static const Level1:Class;
		
		[Embed(source="../Bedroom.oel", mimeType="application/octet-stream")]
		public static const Bedroom:Class;
		
		[Embed(source="../Birthday.oep", mimeType="application/octet-stream")]
		public static const BirthdayOgmoFile:Class;
		
		// Images
		[Embed(source = "../Tiles.png")]
		public static const Tiles:Class;
		
		[Embed(source = "../Chalkboard.png")]
		public static const Chalkboard:Class;
		
		[Embed(source = "../enemy.png")]
		public static const EnemyImage:Class;
		
		[Embed(source = "../TheBed.png")]
		public static const Bed:Class;
		
		[Embed(source = "../TheTable.png")]
		public static const Table:Class;
		
		[Embed(source = "../Door.png")]
		public static const Door:Class;
		
		public static var ImageDictionary:Object = {
			"Tiles.png":Assets.Tiles
			, "Chalkboard.png":Assets.Chalkboard
			, "enemy.png":Assets.EnemyImage
			, "TheBed.png":Assets.Bed
			, "TheTable.png":Assets.Table
			, "Door.png":Assets.Door
		};
			
		// Set screen size
		public static const kScreenWidth:int = 320;
		public static const kScreenHeight:int = 240;
		
		// Set tile parameters
		public static const kTileWidth:int = 16;
		public static const kTileHeight:int = 16;
		public static const kScreenWidthInTiles:int = kScreenWidth / kTileWidth;
		public static const kScreenHeightInTiles:int = kScreenHeight / kTileHeight;
		
				
		public function Assets() 
		{
			
		}
		
	}

}