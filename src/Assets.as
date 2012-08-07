package  
{
	/**
	 * ...
	 * @author Maikeroppi
	 */
	public class Assets 
	{
		
		[Embed(source = "../Level1.oel", mimeType = "application/octet-stream")]
		public static const Level1:Class;
		
		[Embed(source = "../Tiles.png")]
		public static const Tiles:Class;
		
		// Set screen size
		public static const kScreenWidth:int = 640;
		public static const kScreenHeight:int = 480;
		
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