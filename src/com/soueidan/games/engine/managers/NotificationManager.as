package com.soueidan.games.engine.managers
{
	import com.soueidan.games.engine.components.Notification;
	import com.soueidan.games.engine.core.EngineApplication;

	public class NotificationManager
	{
		private static var _notify:Notification;
		private static var _application:EngineApplication = EngineApplicationManager.getInstance();
		
		public static function show(title:String, message:String, seconds:int=8):void {
			if ( _notify ) {
				hide();
			}
			
			_notify = new Notification();
			_notify.seconds = seconds;
			if ( title ) { 
				_notify.title = title;
			}
			_notify.message = message;
			_notify.show();
		}
		
		public static function hide():void
		{
			if ( !_notify ) 
				return;
			
			_notify.hide();
			_notify = null;
		}
	}
}