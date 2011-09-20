package com.soueidan.games.engine.core
{
	import com.smartfoxserver.v2.core.SFSEvent;
	import com.soueidan.games.engine.components.popups.ConnectionLostPopUpWindow;
	import com.soueidan.games.engine.components.popups.NoConnectionPopUpWindow;
	import com.soueidan.games.engine.components.popups.PopUpWindow;
	import com.soueidan.games.engine.managers.EngineApplicationManager;
	import com.soueidan.games.engine.managers.ResourceManager;
	import com.soueidan.games.engine.managers.ServerManager;
	import com.soueidan.games.engine.net.Server;
	
	import spark.components.Application;
	
	public class EngineApplication extends Application
	{
		protected var _parameters:Object;
		protected var _client:Server = ServerManager.getInstance();
		
		public function EngineApplication() {
			super();
			
			EngineApplicationManager.setInstance(this);
			
			_client.addEventListener(SFSEvent.CONNECTION_LOST, connectionLost);
			_client.addEventListener(SFSEvent.CONNECTION, connectionEstablished);	
		}
		
		override protected function  createChildren():void {
			super.createChildren();
			
			_parameters = systemManager.loaderInfo.parameters	
			
			if ( _parameters.language == "ar" ) {
				resourceManager.localeChain = ['ar'];
			} else {
				resourceManager.localeChain = ['en_US'];
			}
			
			var path:String = "";
			if ( _parameters.debug != "true") {
				path = "/";
			}
			
			try {
				styleManager.loadStyleDeclarations(path + "assets/styles/" + ResourceManager.locale + ".swf", true, true);
			} catch(e:Error) {
				trace(e.message);
			}
			
			layoutDirection = resourceManager.getString('resources','direction');
		}
		
		protected function connectionLost(event:SFSEvent):void
		{
			var params:Object = event.params;
			if ( params.reason != "kick" || params.reason != "ban") {
				var popup:PopUpWindow = new ConnectionLostPopUpWindow();
				popup.show()
			}
		}
		
		protected function connectionEstablished(event:SFSEvent):void
		{
			if ( !event.params.success ) {
				var popup:PopUpWindow = new NoConnectionPopUpWindow();
				popup.show();
			}
		}		
	}
}