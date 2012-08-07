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
			//Tiles_ = new Tilemap(Assets.Tiles, 
			//Assets.kScreenWidth, 
			//Assets.kScreenHeight, 
			//Assets.kTileWidth,
			//Assets.kTileHeight);
			//
			//
			//
			//graphic = Tiles_;
			//layer = 1;
			//
			//Tiles_.setRect(0, 0, Assets.kScreenWidthInTiles, Assets.kScreenWidthInTiles, 0);
			//Tiles_.setRect(3, 3, 3, 5, 1);
			//Tiles_.setTile(12, 5, 1);
			//
			//Grid_ = new Grid(Assets.kScreenWidth, Assets.kScreenHeight,
			//Assets.kTileWidth, Assets.kTileHeight, 0, 0);
			//mask = Grid_;
			//
			//Grid_.setRect(3, 3, 3, 5, true);
			//Grid_.setTile(12, 5, true);
			
			

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
			
			var dataList:XMLList;
			var dataElement:XML;
			
			dataList = LevelData.Tiles.tile;
			for each(dataElement in dataList) {
				Tiles_.setTile(
				int(dataElement.@x) ,
				int(dataElement.@y) ,
				int(dataElement.@id)
				);
				Grid_.setTile(int(dataElement.@x) ,
				int(dataElement.@y) ,
				(int(dataElement.@id) == 4)
				);
			}
		}
	}

}