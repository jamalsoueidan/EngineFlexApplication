package com.soueidan.games.engine.managers
{
	import com.soueidan.games.engine.net.Server;
	import com.smartfoxserver.v2.requests.BanMode;
	
	public class ServerManager
	{
		static private var _server:Server;
		
		static public function getInstance():Server {
			if ( !_server ) {
				_server = new Server();
			}
			
			return _server;
		}
	}
}