package com.soueidan.games.engine.managers
{
	import flash.geom.Point;
	
	import mx.controls.ToolTip;
	import mx.core.IToolTip;
	import mx.core.UIComponent;
	import mx.effects.Fade;
	import mx.managers.ToolTipManager;

	public class ToolTipManager
	{
		public static var _currentToolTip:ToolTip;
		
		public static function show(msg:String, component:UIComponent, parent:UIComponent, position:Point=null):ToolTip {
			if ( !position ) {
				position = parent.localToGlobal(new Point(component.x, component.y));
			}
			
			_currentToolTip = mx.managers.ToolTipManager.createToolTip(msg, position.x, position.y, null, component) as ToolTip;
			_currentToolTip.styleName = "toolTip";
			return _currentToolTip;
		}
		
		public static function hide():void {
			if ( !_currentToolTip ) 
				return;
			
			mx.managers.ToolTipManager.destroyToolTip(_currentToolTip);
		}
	}
}