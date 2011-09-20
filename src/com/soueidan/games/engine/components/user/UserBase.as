/**
 * Resources:
 * 	
 * 	[tooltip] user.vip=Vip
 *  [tooltip] status.play=Play with me
 *  [tooltip] status.away=Be right back
 *  [tooltip] status.chat=Chat with me
 *  [text] user.win=Win
 *  [text] user.loss=Loss
 *  [text] user.times_played=Times played
 * 
 * 	
 * @author jamalsoueidan
 * 17. sep 2011
 */	
package com.soueidan.games.engine.components.user
{
	import com.smartfoxserver.v2.entities.SFSUser;
	import com.soueidan.games.engine.assets.UserAsset;
	import com.soueidan.games.engine.components.SkinnedHGroup;
	import com.soueidan.games.engine.formats.UserStatus;
	import com.soueidan.games.engine.managers.*;
	
	import spark.components.HGroup;
	import spark.components.Image;
	import spark.components.Label;
	import spark.components.VGroup;
	import spark.core.ContentCache;
	
	public class UserBase extends SkinnedHGroup
	{	
		private var _status:Image;
		private var _statusChanged:Boolean;
		private var _currentStatus:int = 0;
		
		private var _cache:ContentCache = new ContentCache();
		protected var _avatarImage:Image;
		
		private var _vipImage:Image;
		
		private var _nicknameGroup:HGroup;
		private var _nickname:Label;
		
		
		protected var _restTextGroup:VGroup;
		
		private var _timesPlayed:Label;
		private var _groupWinLose:HGroup;
		private var _win:Label;
		private var _loss:Label;
		
		protected var _textGroup:VGroup;
		
		protected var _sfsUser:SFSUser;
		protected var _sfsUserChanged:Boolean;
		
		public function UserBase() {
			super();
			
			percentWidth = 100;
		}
		
		public function set user(value:SFSUser):void {
			if ( !value ) 
				return;
			
			_sfsUser = value;
			_sfsUserChanged = true;
			invalidateProperties();
		}
		
		public function get user():SFSUser {
			return _sfsUser;
		}
		
		override protected function createChildren():void {
			super.createChildren();
			
			if ( !_avatarImage ) {
				_avatarImage = new Image();
				_avatarImage.width = _avatarImage.height = 48;
				_avatarImage.contentLoader = _cache;
				addElement(_avatarImage);
			}
			
			if ( !_textGroup ) {
				_textGroup = new VGroup();
				_textGroup.percentWidth = 50;
				addElement(_textGroup);
			}
			
			if (!_nicknameGroup ) {
				_nicknameGroup = new HGroup();
				_nicknameGroup.verticalAlign = "middle";
				_textGroup.addElement(_nicknameGroup);
			}
			
			if ( !_nickname ) {
				_nickname = new Label();
				_nickname.styleName = "nickname";
				_nicknameGroup.addElement(_nickname);
			}
			
			if (!_vipImage ) {
				_vipImage = new Image();
				_vipImage.toolTip = ResourceManager.getString("user.vip");	
				_vipImage.contentLoader = _cache;
			}
			
			if ( !_status ) {
				_status = new Image();
				_status.toolTip = ResourceManager.getString("status.play");
				_status.source = UserAsset.imagePlay;
				_nicknameGroup.addElement(_status);
			}
			
			if ( !_restTextGroup ) {
				_restTextGroup = new VGroup();
				_restTextGroup.gap = 0;
				_restTextGroup.percentWidth = 100;
				_textGroup.addElement(_restTextGroup);
			}
			
			if (!_timesPlayed ) {
				_timesPlayed = new Label();
				_restTextGroup.addElement(_timesPlayed);
			}
			
			
			if (!_groupWinLose ) {
				_groupWinLose = new HGroup();
				_restTextGroup.addElement(_groupWinLose);
			}
			
			if ( !_win ) {
				_win = new Label()
				_groupWinLose.addElement(_win);
			}
			
			if ( !_loss ) {
				_loss = new Label();
				_groupWinLose.addElement(_loss);
			}
		}
		
		override protected function commitProperties():void {
			super.commitProperties();
			
			if ( _sfsUserChanged ) {
				_sfsUserChanged = false;
				
				_nickname.text = _sfsUser.name;
				_timesPlayed.text = UserManager.privilege(_sfsUser);	
				_avatarImage.source = UserManager.avatar(_sfsUser);
				
				if ( UserManager.isVip(_sfsUser)) {
					_vipImage.source = UserAsset.imageVip;
					_nicknameGroup.addElement(_vipImage);
				}
				
				_win.text = ResourceManager.getString("user.win") + ": " + UserManager.win(_sfsUser).toString();
				_loss.text = ResourceManager.getString("user.loss") + ": " + UserManager.loss(_sfsUser).toString();
				_timesPlayed.text = ResourceManager.getString("user.times_played") + ": " + UserManager.timesPlayed(_sfsUser).toString();
			}
			
			if ( _statusChanged ) {
				_statusChanged = false;
				updateStatus();
			}
		}
		
		private function updateStatus():void
		{
			var status:int = _sfsUser.getVariable("status").getIntValue();
			if ( _currentStatus == status ) {
				return;
			}
			
			_currentStatus = status;
			
			if ( _currentStatus == UserStatus.isAway) {
				_status.toolTip = ResourceManager.getString("status.away");
				_status.source = UserAsset.imageAway;
			} else if ( _currentStatus == UserStatus.isChat) {
				_status.toolTip = ResourceManager.getString("status.chat");
				_status.source = UserAsset.imageChat;
			} else {
				_status.toolTip = ResourceManager.getString("status.play");
				_status.source = UserAsset.imagePlay;
			}
		}
		
		public function update():void {
			_statusChanged = true;
			invalidateProperties();
		}
	}
}