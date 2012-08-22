package
{
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	
	public class BirthdayWorld extends World
	{
		public var OgmoData:XML;
		
		private var PlayerEntity_:Player;
		
		// Variable for holding the entities in Birthday.oep
		public static var EntityMap:Dictionary;

		public function BirthdayWorld()
		{
			EntityMap = new Dictionary;
		}
		
		public function loadEntities(xml:Class):void
		{
			var rawData:ByteArray = new xml;
			var dataString:String = rawData.readUTFBytes(rawData.length);
			OgmoData = new XML(dataString);
			
			var dataElement:XML;
			var dataList:XMLList = OgmoData.EntityDefinitions.EntityDefinition;
			var currentEntity:Entity;
			
			for each(var key:Class in Assets.ImageDictionary) {
				trace(key);
			}
			
			var Name:String;
			for each(dataElement in dataList) {
				// Convert XML to type String for switch statement as well as EntityMap key
				Name = dataElement.@Name;
				trace(Name);
						
				switch(Name) {
				case "Player":
					PlayerEntity_ = new Player(0, 0);
					PlayerEntity_.SetWorld(this);
					EntityMap["Player"] = PlayerEntity_;
					break;

				default:
					//trace("No associated entity");
					if (dataElement.ImageDefinition.@DrawMode == "Image") {
						currentEntity = new Entity(
							dataElement.Origin.@X, dataElement.Origin.@Y); 
						currentEntity.graphic = new Image(Assets.ImageDictionary[dataElement.ImageDefinition.@ImagePath]);
						currentEntity.type = Name.toLowerCase();
						currentEntity.collidable = true;
						trace(dataElement.Size.Width);
						trace(dataElement.Size.Height);
						currentEntity.setHitbox(dataElement.Size.Width, dataElement.Size.Height);
						EntityMap[Name] = currentEntity;						
					} //else {
						//currentEntity = new Entity(dataElement.Origin.@X, dataElement.Origin.@Y);
						//currentEntity.width = dataElement.Size.@Width;
						//currentEntity.height = dataElement.Size.@Height;
						//currentEntity.addGraphic(
							//Image.createRect(
								//currentEntity.width,
								//currentEntity.height,
								//(dataElement.ImageDefinition.RectColor.@R <<< 16) 
								//| (dataElement.ImageDefinition.RectColor.@G <<< 8) 
								//| (dataElement.ImageDefinition.RectColor.@B)
							//)
						//);
						//EntityMap[dataElement.@Name] = currentEntity;
						
					//}
					break;
				}
			}
		}
		
		public function changeLevel(levelData:Class):void 
		{
			var level:Level = new Level(levelData);
			var dataList:XMLList = level.LevelData.Objects.*;
			var dataElement:XML;
			var currentEntity:Entity;
			
			// Clear current entities / level if set
			removeAll();
			
			// Load entities
			for each(dataElement in dataList) {
				//trace(dataElement);
				if (dataElement.name() == "Player") {
					PlayerEntity_.SetLevelWidth(level.LevelWidth_);
				}
				currentEntity = EntityMap[dataElement.name()];
				currentEntity.x = dataElement.@x;
				currentEntity.y = dataElement.@y;
				add(currentEntity);
			}
			
			add(level);
			FP.camera.x = 0;
			FP.camera.y = 0;
		}
		
		override public function begin():void
		{
			// Get our entities from Ogmo file
			loadEntities(Assets.BirthdayOgmoFile);
			
			// Load the starting level
			changeLevel(Assets.Bedroom);
			
			super.begin();
		}
	}
}