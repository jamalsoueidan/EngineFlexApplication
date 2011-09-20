package com.soueidan.games.engine.managers
{
	import com.soueidan.games.engine.core.EngineApplication;

	public class EngineApplicationManager
	{
		public static var _application:EngineApplication;
		
		public static function setInstance(application:EngineApplication):void {
			_application = application;
		}
		
		public static function getInstance():EngineApplication {
			return _application;
		}
	}
}