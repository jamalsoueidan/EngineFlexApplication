package com.soueidan.games.engine.components
{
	import com.soueidan.games.engine.skins.VContainerSkin;
	
	import spark.components.SkinnableContainer;
	
	public class SkinnedVGroup extends SkinnableContainer
	{
		public function SkinnedVGroup() {
			super();
			
			setStyle("skinClass", Class(VContainerSkin));
		}
	}
}