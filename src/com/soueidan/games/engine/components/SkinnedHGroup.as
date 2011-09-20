package com.soueidan.games.engine.components
{
	import com.soueidan.games.engine.skins.HContainerSkin;
	
	import spark.components.SkinnableContainer;

	public class SkinnedHGroup extends SkinnableContainer
	{
		public function SkinnedHGroup() {
			super();
			
			setStyle("skinClass", Class(HContainerSkin));
		}
	}
}