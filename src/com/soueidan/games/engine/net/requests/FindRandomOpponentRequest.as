package com.soueidan.games.engine.net.requests
{
	import com.smartfoxserver.v2.entities.data.ISFSObject;
	import com.smartfoxserver.v2.entities.data.SFSObject;
	import com.smartfoxserver.v2.requests.ExtensionRequest;
	import com.soueidan.games.engine.managers.ServerManager;
	
	public class FindRandomOpponentRequest extends ExtensionRequest
	{
		public static const UPDATE_STATUS:String = "find_player";
		
		//addOrRemove is true to add on waiting list or false to remove from waiting list
		public function FindRandomOpponentRequest(addOrRemove:Boolean) {
			var params:ISFSObject = new SFSObject();
			params.putBool("add", addOrRemove);
			
			super(UPDATE_STATUS, params, ServerManager.getInstance().currentRoom, false);
		}
	}
}