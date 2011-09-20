package com.soueidan.games.engine.components
{
	import com.soueidan.games.engine.skins.PanelSkin;
	
	import spark.components.HGroup;
	import spark.components.Panel;
	
	public class PanelContainer extends Panel
	{	
		[SkinPart(required="true")]
		public var titleGroup:HGroup;
	
		private var _titleGroup:HGroup;
		
		public function get titleGroupContent():HGroup {
			if (titleGroup) { 
				return titleGroup;
			} else {
				_titleGroup = new HGroup();
				return _titleGroup;
			}
		}
		
		public function PanelContainer()
		{
			super();
			
			percentWidth = 100;
			
			setStyle("skinClass", Class(PanelSkin));
			setStyle("dropShadowVisible", false);
		}
		
		override protected function partAdded(partName:String, instance:Object):void {
			super.partAdded(partName, instance);
			
			if ( instance == titleGroup ) {
				var content:HGroup = instance as HGroup;
				if ( _titleGroup ) {
					while(_titleGroup.numChildren>0){
						content.addElement(_titleGroup.removeElementAt(0));
					}
				}
				titleGroup = instance as HGroup;
			}
		}
		
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void {
			graphics.clear();
			
			super.updateDisplayList(unscaledWidth, unscaledHeight);
		}
	}
}