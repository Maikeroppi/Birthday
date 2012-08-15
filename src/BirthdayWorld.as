package
{
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Image;
	
	public class BirthdayWorld extends World
	{
		public var OgmoData:XML;
		
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
				Name = dataElement.@Name;
				trace(Name);
						
				switch(Name) {
				case "Player":
					EntityMap["Player"] = new Player(0, 0);
					break;
					
				//case "TheBed":
					//EntityMap["TheBed"] = new Entity(0, 0, Assets.Bed);
					//break;
					//
				//case "TheTable":
					//EntityMap["TheTable"] = new Entity(0, 0, Assets.Table);
					//break;
					//
				//case "Chalkboard":
					//EntityMap["Chalkboard"] = new Entity(0, 0, Assets.Chalkboard);
					//break;
					//
				//case "Enemy":
					//EntityMap["Enemy"] = new Entity(0, 0, Assets.EnemyImage);
					//break;
					
				default:
					//trace("No associated entity");
					if (dataElement.ImageDefinition.@DrawMode == "Image") {
						//trace(dataElement.@Name);
						//trace(dataElement.ImageDefinition.@ImagePath);
						//trace(Assets.ImageDictionary[dataElement.ImageDefinition.@ImagePath]);
						EntityMap[Name] = new Entity(
							dataElement.Origin.@X, dataElement.Origin.@Y); 
						EntityMap[Name].graphic = new Image(Assets.ImageDictionary[dataElement.ImageDefinition.@ImagePath]);
						
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
		
		override public function begin():void
		{
			var level:Level = new Level(Assets.Bedroom);
			var dataList:XMLList = level.LevelData.Objects.*;
			var dataElement:XML;
			var currentEntity:Entity;
			
			loadEntities(Assets.BirthdayOgmoFile);
			
					
			// Load entities
			for each(dataElement in dataList) {
				//trace(dataElement);
				currentEntity = EntityMap[dataElement.name()];
				currentEntity.x = dataElement.@x;
				currentEntity.y = dataElement.@y;
				add(currentEntity);
			}
			
			add(level);			
			super.begin();
		}
	}
}