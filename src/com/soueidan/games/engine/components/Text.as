package com.soueidan.games.engine.components
{
	import com.soueidan.games.engine.managers.ResourceManager;
	
	import spark.components.TextArea;
	
	public class Text extends TextArea
	{
		public function Text()
		{
			super();
			
			selectable = editable = false;
			setStyle("borderVisible", false);
			setStyle("textAlign", ResourceManager.getString("left"));
		}
		
		override protected function createChildren():void {
			
			super.createChildren();
			
			textDisplay.multiline = true;
		}
		
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void {
			
			height = (heightInLines*4)
			
			super.updateDisplayList(unscaledWidth, unscaledHeight);
		}
	}
}