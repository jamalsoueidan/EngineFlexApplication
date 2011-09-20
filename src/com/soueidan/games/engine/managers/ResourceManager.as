package com.soueidan.games.engine.managers
{
	import mx.resources.ResourceManager;
	
	public class ResourceManager
	{
		public static function getString(value:String):String
		{
			return mx.resources.ResourceManager.getInstance().getString("resources", value);
		}
		
		public static function getNumber(value:String):Number {
			return mx.resources.ResourceManager.getInstance().getNumber("resources", value);
		}
		
		public static function getInt(value:String):int {
			return mx.resources.ResourceManager.getInstance().getInt("resources", value);
		}
		
		public static function isLocale(value:String):Boolean {
			return (mx.resources.ResourceManager.getInstance().localeChain[0] == value);
		}
		
		public static function get locale():String {
			return mx.resources.ResourceManager.getInstance().localeChain[0];
		}
	}
}