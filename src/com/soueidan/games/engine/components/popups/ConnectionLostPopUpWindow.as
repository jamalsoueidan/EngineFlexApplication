/**
 * Description:
 * 
 * 	You show this popupwindow when user loss connection to server.
 * 
 * Resources:
 * 	
 * 	[text] connection_lost.title=Connection lost
 *  [text] connection_lost.description=You lost connection to the lobby server! Because you were inactive in more then 2 minutes. Please reload this page to rejoin.
 * 
 * 	
 * @author jamalsoueidan
 * 18. sep 2011
 */	
package com.soueidan.games.engine.components.popups
{
	import com.soueidan.games.engine.components.Text;
	import com.soueidan.games.engine.managers.ResourceManager;
	
	import spark.components.Button;
	
	public class ConnectionLostPopUpWindow extends PopUpWindow
	{
		private var _text:Text;
		
		private var _join:Button;
		
		public function ConnectionLostPopUpWindow() {
			super();
			
			title = ResourceManager.getString("connection_lost.title");
			
			width = 400;
		}
		
		override protected function createChildren():void {
			super.createChildren();
			
			if (!_text ) {
				_text = new Text();
				_text.height = 50;
				_text.percentWidth = 100;
				_text.text = ResourceManager.getString("connection_lost.description");
				addElement(_text);
			}
			
			closeButton.visible = false;
		}
	}
}