package com.soueidan.games.engine.assets
{
	import mx.core.BitmapAsset;

	public class UserAsset
	{
		[Embed(source="assets/vip.png")] 
		private static var _vipSource:Class;
		public static function get imageVip():BitmapAsset { return new _vipSource();}
		
		[Embed(source="assets/status/away.png")] 
		private static var _awaySource:Class;
		public static function get imageAway():BitmapAsset { return new _awaySource();}
		
		[Embed(source="assets/status/chat.png")] 
		private static var _chatSource:Class;
		public static function get imageChat():BitmapAsset { return new _chatSource(); }
		
		
		[Embed(source="assets/status/play.png")]
		private static var _playSource:Class;
		public static function get imagePlay():BitmapAsset { return new _chatSource(); }
	}
}