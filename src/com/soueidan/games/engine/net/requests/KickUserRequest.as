package com.soueidan.games.engine.net.requests
{
	import com.smartfoxserver.v2.requests.KickUserRequest;
	
	public class KickUserRequest extends com.smartfoxserver.v2.requests.KickUserRequest
	{
		public function KickUserRequest(userId:int, message:String=null, delaySeconds:int=5)
		{
			super(userId, message, delaySeconds);
		}
	}
}