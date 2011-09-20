package com.soueidan.games.engine.components.chat
{
	import com.smartfoxserver.v2.requests.IRequest;
	import com.smartfoxserver.v2.requests.PublicMessageRequest;
	import com.soueidan.games.engine.components.SkinnedHGroup;
	import com.soueidan.games.engine.managers.ResourceManager;
	import com.soueidan.games.engine.managers.ServerManager;
	import com.soueidan.games.engine.net.Server;
	
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.ui.Keyboard;
	
	import flashx.textLayout.formats.Direction;
	
	import mx.utils.StringUtil;
	
	import spark.components.Button;
	import spark.components.TextInput;

	public class ChatForm extends SkinnedHGroup
	{
		private var _server:Server = ServerManager.getInstance();
		
		private var _textInput:TextInput;
		private var _submit:Button;
		
		override protected function createChildren():void {
			super.createChildren();
			
			if ( !_textInput ) {
				_textInput = new TextInput();
				if ( ResourceManager.getString("direction") == Direction.RTL ) {
					_textInput.setStyle("textAlign", "right");
				}
				_textInput.addEventListener(KeyboardEvent.KEY_DOWN, keyboardDown);
				_textInput.setFocus();
				_textInput.percentWidth = 60;
				addElement(_textInput);
			}
			
			if ( !_submit ) {
				_submit = new Button();
				_submit.label = ResourceManager.getString("chat.send");
				_submit.addEventListener(MouseEvent.CLICK, submitForm);
				_submit.percentWidth = 40;
				addElement(_submit);
			}
		}
		
		private function submitForm(event:MouseEvent=null):void {
			var msg:String = StringUtil.trim(_textInput.text);
			if ( msg.length > 0 ) {
				var request:IRequest = new PublicMessageRequest(msg);
				_server.send(request);
			}
			_textInput.text = "";
		}
		
		private function keyboardDown(event:KeyboardEvent):void
		{
			if ( event.keyCode == Keyboard.ENTER ) {
				submitForm();
			}
		}
	}
}