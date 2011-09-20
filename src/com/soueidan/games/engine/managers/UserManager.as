package com.soueidan.games.engine.managers
{	
	import com.smartfoxserver.v2.entities.SFSUser;
	import com.smartfoxserver.v2.entities.User;
	import com.soueidan.games.engine.formats.UserPermission;
	import com.soueidan.games.engine.formats.UserStatus;
	
	public class UserManager
	{		
		static public function privilege(user:SFSUser):String {
			if ( user.privilegeId == UserPermission.ADMIN_ID ) {
				return UserPermission.ADMIN;
			} else if( user.privilegeId == UserPermission.MODERATOR_ID ) {
				return UserPermission.MODERATOR;
			} else if ( user.privilegeId == UserPermission.STANDARD_ID ) {
				return UserPermission.STANDARD;
			} else {
				return UserPermission.GUEST;
			}
		}
		
		public static function avatar(user:SFSUser):String
		{
			return user.getVariable("avatar_url").getStringValue();
		}
		
		public static function win(user:SFSUser):Number
		{
			return user.getVariable("win").getIntValue(); 
		}
		
		public static function loss(user:SFSUser):Number
		{
			return user.getVariable("loss").getIntValue();
		}
		
		public static function points(user:SFSUser):Number
		{
			return user.getVariable("points").getIntValue();
		}
		
		public static function timesPlayed(user:SFSUser):Number
		{
			return UserManager.win(user) + UserManager.loss(user);
		}
		
		public static function isReady(user:User):Boolean
		{
			return ( user.getVariable("status").getIntValue() == UserStatus.isPlay );
		}
		
		public static function isVip(user:SFSUser):Boolean {
			return user.getVariable("vip").getBoolValue();
		}
		
		public static function isAtLeastModerator(user:User):Boolean
		{
			return ( user.isModerator() || user.isAdmin() );
		}
	}
}