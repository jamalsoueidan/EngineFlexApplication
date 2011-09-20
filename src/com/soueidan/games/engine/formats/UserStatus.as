package com.soueidan.games.engine.formats
{
	import com.soueidan.games.engine.managers.ResourceManager;
	
	import mx.collections.ArrayCollection;
	import mx.core.BitmapAsset;
	
	public class UserStatus
	{
		public static function getList():ArrayCollection {
			var list:ArrayCollection = new ArrayCollection();
			list.addItem({id:0, label:ResourceManager.getString("status.play")});
			list.addItem({id:1, label:ResourceManager.getString("status.chat")});
			list.addItem({id:2, label:ResourceManager.getString("status.away")});
			return list;
		}
		
		public static function get isAway():int {
			return 2;
		}
		
		public static function get isChat():int {
			return 1;
		}
		
		public static function get isPlay():int {
			return 0;
		}
	}
}