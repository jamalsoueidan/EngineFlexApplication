package com.soueidan.games.engine.components.chat
{
	import com.smartfoxserver.v2.core.SFSEvent;
	import com.smartfoxserver.v2.entities.SFSUser;
	import com.soueidan.games.engine.components.SkinnedVGroup;
	import com.soueidan.games.engine.managers.*;
	import com.soueidan.games.engine.net.*;
	import com.soueidan.games.engine.skins.*;
	
	import spark.components.*;
	import spark.utils.TextFlowUtil;
	
	public class ChatMessage extends SkinnedVGroup 
	{
		private var _server:Server = ServerManager.getInstance();
		
		private static const MAX_LINES:int = 30;
		
		private var _textArea:TextArea;
		private var _sizeUpdate:Boolean = true;
		
		private var _textChanged:Boolean;
		private var _texts:Array = [];
		
		
		public function ChatMessage()
		{
			super();
			
			_server.addEventListener(SFSEvent.USER_ENTER_ROOM, userEnterRoom);
			_server.addEventListener(SFSEvent.PUBLIC_MESSAGE, publicMessage);
		}
		
		override protected function createChildren():void {
			super.createChildren();
			
			if ( !_textArea ) {
				_textArea = new TextArea();
				_textArea.setStyle("borderVisible", false);
				_textArea.editable = _textArea.selectable = false;
				_textArea.percentWidth = 100;
				_textArea.percentHeight = 100;
				addElement(_textArea);
			}
		}
		
		private function userEnterRoom(event:SFSEvent):void
		{
			var user:SFSUser = event.params.user;
			
			var name:String = user.name;
			if ( UserManager.isVip(user)) {
				name += ":vip:";
			}
			
			var msg:String = name + " " + ResourceManager.getString("chat.msg");
			if ( ResourceManager.isLocale("ar") ) {
				msg = ResourceManager.getString("chat.msg") + " " + name;
			}
			
			systemMessage(msg);
		}
		
		public function systemMessage(msg:String):void {
			var color:String = "0x51d63c";
			_texts.push('<p fontWeight="normal" fontSize="16"><span fontWeight="bold" color="' + color + '">' + ResourceManager.getString("chat.system") + ': </span><span  color="' + color + '">' + ChatManager.convertSmilies(msg, color) + '</span></p>');
			updateTextArea();
		}
		
		public function publicMessage(event:SFSEvent):void
		{
			var user:SFSUser = event.params.sender;
			var msg:String = event.params.message;
			trace(msg);
			var fontSize:String = "13";
			var color:String = "0x000000";
			if ( user.isAdmin() ) {
				color = "0xFF3504";
				fontSize = "15";
			}
			
			if ( user.isModerator() ) {
				color = "0xf9be0a";
				fontSize = "14";
			}
			
			var name:String = user.name + "";
			if ( UserManager.isVip(user)) {
				name += ChatManager.convertSmilies(":vip:", color) + ": </span>";
			} else {
				name += ":</span>";
			}
			
			
			_texts.push('<p fontWeight="normal" fontSize="' + fontSize + '"><span fontWeight="bold" color="' + color + '">' + name + '<span color="0xFFFFFF">ا</span><span  color="' + color + '">' + ChatManager.convertSmilies(msg, color) + '</span></p>');
			
			updateTextArea();
		}	
		
		private function updateTextArea():void
		{
			_textChanged = true;
			invalidateProperties();
		}		
		
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void {
			super.updateDisplayList(unscaledWidth, unscaledHeight);
			
			// fix for textarea height
			if ( _sizeUpdate ) {
				_sizeUpdate = false;
				_textArea.height = unscaledHeight - 18;
			}
		}
		
		override protected function commitProperties():void {
			super.commitProperties();
			
			if ( _textChanged ) {
				_textChanged = false;
				
				if (_texts.length > MAX_LINES ) {
					_texts.shift();
				}
				
				var text:String = '';
				for(var i:int=0;i<_texts.length;i++) {
					text += _texts[i];
				}
				
				_textArea.textFlow = TextFlowUtil.importFromString(text);
				_textArea.textFlow.direction = ResourceManager.getString("direction");
				_textArea.textFlow.flowComposer.updateAllControllers();
			}
			
		}
		
		
	}
}