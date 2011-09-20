package com.soueidan.games.engine.components.chat
{	
	import com.soueidan.games.engine.components.PanelContainer;
	import com.soueidan.games.engine.managers.ResourceManager;

	public class ChatPanel extends PanelContainer
	{
		private var _form:ChatForm;
		private var _message:ChatMessage;
		
		public function systemMessage(value:String):void {
			_message.systemMessage(value);
		}
		
		public function ChatPanel() {
			super();
			
			title = ResourceManager.getString("chat.title");
		}
		
		override protected function createChildren():void {
			super.createChildren();
			
			if ( !_message ) {
				_message = new ChatMessage();
				_message.percentWidth = 100;
				_message.percentHeight = 100;
				addElement(_message);
			}
			
			if (!_form) {
				_form  = new ChatForm();
				_form.percentWidth = 100;
				_form.height = 40;
				addElement(_form);
			}
		}
		
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void {
			trace("panel", unscaledWidth, unscaledHeight);
			
			super.updateDisplayList(unscaledWidth, unscaledHeight);
		}
	}
}