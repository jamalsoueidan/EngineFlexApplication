package com.soueidan.games.engine.net.requests
{
	import com.smartfoxserver.v2.requests.BanUserRequest;
	
	public class BanUserRequest extends com.smartfoxserver.v2.requests.BanUserRequest
	{
		public function BanUserRequest(userId:int, message:String=null, banMode:int=1, delaySeconds:int=5, durationHours:int=24)
		{
			super(userId, message, banMode, delaySeconds, durationHours);
		}
	}
}