package  
{
	import flash.utils.ByteArray;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Tilemap;
	import net.flashpunk.masks.Grid;
	/**
	 * ...
	 * @author Maikeroppi
	 */
	public class Level extends Entity
	{
		private var Tiles_:Tilemap;
		private var Grid_:Grid;
		public var LevelData:XML;
		
		public function Level(xml:Class)
		{
			Tiles_ = new Tilemap(Assets.Tiles, 
			Assets.kScreenWidth, 
			Assets.kScreenHeight, 
			Assets.kTileWidth,
			Assets.kTileHeight);
			
			graphic = Tiles_;
			layer = 1;
			
				
			Grid_ = new Grid(Assets.kScreenWidth, Assets.kScreenHeight, Assets.kTileWidth, Assets.kTileHeight, 0, 0);
			mask = Grid_;
					
			type = "level";
			
			loadLevel(xml);
		}
		
		private function loadLevel(xml:Class):void
		{
			var rawData:ByteArray = new xml;
			var dataString:String = rawData.readUTFBytes(rawData.length);
			LevelData = new XML(dataString);
			
			// Load tiles
			Tiles_.loadFromString(LevelData.Tiles[0]);
			
			// Setup grid
			Grid_.loadFromString(LevelData.Solids[0], "", "\n");
		}
	}

}